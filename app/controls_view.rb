class ControlsView < UIView
  attr_reader :play, :pause, :reset, :animate
  def init
    super

    addSubview(@play = UIButton.new)
    @play.frame = [[0, 0], [280, 50]]
    @play.setTitle('Play', forState: UIControlStateNormal)
    @play.setTitleColor(UIColor.blueColor, forState: UIControlStateNormal)

    addSubview(@pause = UIButton.new)
    @pause.frame = [[0, 50], [280, 50]]
    @pause.setTitle('Pause', forState: UIControlStateNormal)
    @pause.setTitleColor(UIColor.blueColor, forState: UIControlStateNormal)

    addSubview(@reset = UIButton.new)
    @reset.frame = [[0, 100], [280, 50]]
    @reset.setTitle('Reset', forState: UIControlStateNormal)
    @reset.setTitleColor(UIColor.blueColor, forState: UIControlStateNormal)

    addSubview(@animate = UIButton.new)
    @animate.frame = [[0, 150], [280, 50]]
    @animate.setTitle('Animate', forState: UIControlStateNormal)
    @animate.setTitleColor(UIColor.blueColor, forState: UIControlStateNormal)

    self
  end
end
