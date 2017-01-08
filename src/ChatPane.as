package {
	
	import flash.display.Sprite;
	
	import org.aswing.ASColor;
	import org.aswing.AsWingConstants;
	import org.aswing.AsWingManager;
	import org.aswing.BorderLayout;
	import org.aswing.Container;
	import org.aswing.FlowLayout;
	import org.aswing.JButton;
	import org.aswing.JFrame;
	import org.aswing.JPanel;
	import org.aswing.JScrollPane;
	import org.aswing.JSplitPane;
	import org.aswing.JTextArea;
	import org.aswing.SoftBoxLayout;
	
	/**
	 * AsWing 聊天面板布局实例
	 *
	 * @author harry
	 */
	public class ChatPane extends Sprite {
		
		private var frame:JFrame;
		private var mainContainer:Container;
		
		public function ChatPane() {
			AsWingManager.initAsStandard(this);
			
			frame = new JFrame(this, "AsWing Chat Pane");
			mainContainer = frame.getContentPane();
			mainContainer.setLayout(new BorderLayout(5));
			
			mainContainer.append(getNorthPane(), BorderLayout.NORTH);
			mainContainer.append(getCenterPane(), BorderLayout.CENTER);
			mainContainer.append(getEastPane(), BorderLayout.EAST);
			
			frame.pack();
			frame.show();
		}
		
		/**
		 * 顶部按钮面板
		 */
		protected function getNorthPane():JPanel {
			var pane:JPanel = new JPanel(new FlowLayout());
			for(var i:int=0; i<5; i++) {
				pane.append(new JButton("Btn"+i));
			}
			return pane;
		}
		
		/**
		 * 中间文本区域
		 */
		protected function getCenterPane():Container {
			// 文本显示区域
			var displayArea:JScrollPane = new JScrollPane(new JTextArea());
			
			var sp:JSplitPane = new JSplitPane(AsWingConstants.VERTICAL,
				false,
				displayArea,
				getInputArea());
			return sp;
		}
		/**
		 * 文本输入区域，包括按钮条，输入文本，发送按钮
		 */
		protected function getInputArea():JPanel {
			
			var inputArea:JPanel = new JPanel(new BorderLayout(0, 5));
			
			var btnBar:JPanel = new JPanel(new FlowLayout());
			for(var i:int=0; i<6; i++) btnBar.append(new JButton("B"+i));
			inputArea.append(btnBar, BorderLayout.NORTH); // 将按钮条放置在顶部。
			
			var inputPane:JScrollPane = new JScrollPane(new JTextArea());
			inputArea.append(inputPane, BorderLayout.CENTER); //输入框放在中间
			
			var sendButtonPane:JPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT,5,5,false));
			sendButtonPane.append(new JButton("发送"));
			inputArea.append(sendButtonPane, BorderLayout.SOUTH); //发送按钮在底部
			
			return inputArea;
		}
		
		/**
		 * 右侧面板
		 */
		protected function getEastPane():JPanel {
			var pane:JPanel = new JPanel(new SoftBoxLayout(SoftBoxLayout.Y_AXIS, 5));
			
			var pic1:JPanel = new JPanel();
			pic1.setOpaque(true);
			pic1.setBackground(new ASColor(0xFF6600));
			pic1.setPreferredHeight(100);
			
			var pic2:JPanel = new JPanel();
			pic2.setOpaque(true);
			pic2.setBackground(new ASColor(0x0000FF));
			pic2.setPreferredHeight(100);
			
			pane.appendAll(pic1, pic2);
			pane.setPreferredWidth(100);
			return pane;
		}
	}
}