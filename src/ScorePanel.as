package
{
	import org.aswing.JPanel;
	import org.aswing.JProgressBar;
	import org.aswing.JSlider;
	import org.aswing.LayoutManager;
	
	public class ScorePanel extends JPanel
	{
		public function ScorePanel(layout:LayoutManager=null)
		{
			super(layout);
			name = "ScorePanel";
			
			var slider:JSlider = new JSlider();
			append(slider);
			slider.setMajorTickSpacing(20);
			slider.setMinorTickSpacing(4);
			slider.setPaintTicks(true);
			slider.setShowValueTip(true);
			
			var progress:JProgressBar = new JProgressBar();
			progress.setIndeterminate(true);
			append(progress);
		}
	}
}