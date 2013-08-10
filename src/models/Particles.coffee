
stage = require '../stage'
translate = require '../translate'
Entity = require './Entity'

class Particles extends Entity

  constructor: ->
    @x = 0
    @y = 0
    @radius = 5
    @ready = false

    @particleImage = new Image()
    @particleImage.onload = => @ready = true
    @particleImage.src = "js/vendor/particleEmitter/examples/images/particle_base.png";

    super

  tick: ->

    return null unless @ready

    emitter = new createjs.ParticleEmitter(@particleImage);
    emitter.position = new createjs.Point(0, 0);
    emitter.emitterType = createjs.ParticleEmitterType.Emit;
    emitter.emissionRate = 50;
    emitter.maxParticles = 200;
    emitter.life = 3000;
    emitter.lifeVar = 1000;
    emitter.speed = 30;
    emitter.speedVar = 0;
    emitter.positionVarX = 0;
    emitter.positionVarY = 0;
    emitter.accelerationX = 0;
    emitter.accelerationY = 0;
    emitter.radialAcceleration = 0;
    emitter.radialAccelerationVar = 0;
    emitter.tangentalAcceleration = 0;
    emitter.tangentalAccelerationVar = 0;
    emitter.angle = 220;
    emitter.angleVar = 10;
    emitter.startSpin = 0;
    emitter.startSpinVar = 0;
    emitter.endSpin = null;
    emitter.endSpinVar = null;
    emitter.startColor = [190, 190, 255];
    emitter.startColorVar = [50, 50, 0];
    emitter.startOpacity = 1;
    emitter.endColor = null;
    emitter.endColorVar = null;
    emitter.endOpacity = 0.5;
    emitter.startSize = 20;
    emitter.startSizeVar = 0;
    emitter.endSize = 0;
    emitter.endSizeVar = 5;

    @stage.addChild(emitter);

    # @stage.rotation+=10

  render: ->

    # @stage.x = translate.x 0
    # @stage.y = translate.y 0

    # @particle = new createjs.Shape()
    # @particle.graphics.beginFill('blue').drawCircle 0, 0, translate.screen @radius
    # @stage.addChild @particle

module.exports = Particles


        # var canvas;         // the canvas element
        # var context;        // the 2d context of the canvas
        # var stage;          // the createjs stage
        # var emitter;        // the emitter
        # var fpsLabel;       // label to show the current frames per second
        # var particleImage;  // the image to use for each particle

        # function loadAssets() {
        #     particleImage = new Image();
        #     particleImage.onload = initCanvas;
        #     particleImage.src = "images/particle_base.png";
            
        # }

        # function initCanvas() {

        #     canvas = document.getElementById('particleEmitterCanvas');
        #     context = canvas.getContext("2d");
        #     stage = new createjs.Stage(canvas);

        #     createjs.Ticker.setFPS(30);
        #     createjs.Ticker.addListener(update);

        #     addFPS();
        #     addParticleEmitter(canvas.width / 2, canvas.height / 2);
        # }

        # function addFPS() {

        #     fpsLabel = new createjs.Text("-- fps", "bold 14px Arial", "#BBBBBB");
        #     stage.addChild(fpsLabel);
        # }

        # function addParticleEmitter(x, y) {

        #     emitter = new createjs.ParticleEmitter(particleImage);
        #     emitter.position = new createjs.Point(x, y);
        #     emitter.emitterType = createjs.ParticleEmitterType.Emit;
        #     emitter.emissionRate = 50;
        #     emitter.maxParticles = 200;
        #     emitter.life = 3000;
        #     emitter.lifeVar = 1000;
        #     emitter.speed = 30;
        #     emitter.speedVar = 0;
        #     emitter.positionVarX = 0;
        #     emitter.positionVarY = 0;
        #     emitter.accelerationX = 0;
        #     emitter.accelerationY = 0;
        #     emitter.radialAcceleration = 0;
        #     emitter.radialAccelerationVar = 0;
        #     emitter.tangentalAcceleration = 0;
        #     emitter.tangentalAccelerationVar = 0;
        #     emitter.angle = 220;
        #     emitter.angleVar = 10;
        #     emitter.startSpin = 0;
        #     emitter.startSpinVar = 0;
        #     emitter.endSpin = null;
        #     emitter.endSpinVar = null;
        #     emitter.startColor = [190, 190, 255];
        #     emitter.startColorVar = [50, 50, 0];
        #     emitter.startOpacity = 1;
        #     emitter.endColor = null;
        #     emitter.endColorVar = null;
        #     emitter.endOpacity = 0.5;
        #     emitter.startSize = 20;
        #     emitter.startSizeVar = 0;
        #     emitter.endSize = 0;
        #     emitter.endSizeVar = 5;

        #     stage.addChild(emitter);
        # }

        # function update() {
        #     fpsLabel.text = Math.round(createjs.Ticker.getMeasuredFPS()) + " fps";
        #     stage.update();
        # }