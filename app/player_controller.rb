class PlayerController < UIViewController
  attr_reader :player, :player_layer

  def viewDidLoad
    super

    view.backgroundColor = UIColor.whiteColor

    # file_url = NSURL.URLWithString('http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4')
    file_url = NSBundle.mainBundle.URLForResource('big_buck_bunny', withExtension: 'mp4')
    @player = AVPlayer.playerWithURL(file_url)

    @player_layer = AVPlayerLayer.playerLayerWithPlayer(@player)
    @player_layer.frame = CGRectMake(0, 20, 320, 240)
    @player_layer.backgroundColor = UIColor.blackColor.CGColor
    @player_layer.speed = 0.2
    view.layer.addSublayer(@player_layer)

    view.addSubview(@controls = ControlsView.new)
    @controls.frame = CGRectMake(20, 300, 280, 200)
    @controls.play.addTarget(self, action: 'play:', forControlEvents: UIControlEventTouchUpInside)
    @controls.pause.addTarget(self, action: 'pause:', forControlEvents: UIControlEventTouchUpInside)
    @controls.reset.addTarget(self, action: 'reset:', forControlEvents: UIControlEventTouchUpInside)
    @controls.animate.addTarget(self, action: 'animate:', forControlEvents: UIControlEventTouchUpInside)
  end

  def viewDidAppear(_)
    super
    @player.play
  end

  def play(_)
    @player.play
  end

  def pause(_)
    @player.pause
  end

  def reset(_)
    @player.seekToTime(KCMTimeZero)
    @player.play
  end

  def animate(_)
    @scaled ||= false
    if !@scaled
      @player_layer.transform = CATransform3DConcat(
        CATransform3DMakeScale(0.5, 0.5, 1),
        CATransform3DMakeTranslation(0, 100, 0)
      )
      @player_layer.opacity = 0.3
    else
      @player_layer.transform = CATransform3DConcat(
        CATransform3DMakeScale(1, 1, 1),
        CATransform3DMakeTranslation(0, 0, 0)
      )
      @player_layer.opacity = 1
    end
    @scaled = !@scaled
  end
end
