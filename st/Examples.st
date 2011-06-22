Widget subclass: #Counter
    count := count + 1.
    header contents: [:html | html with: count asString]
    count := count - 1.
    header contents: [:html | html with: count asString]
    super initialize.
    count := 0

    header := html h1 
	with: count asString;
	yourself.
    html button
	with: '++';
	onClick: [self increase].
    html button
	with: '--';
	onClick: [self decrease]

	^self class width
	^self class height
	^self class squares
	aPiece glueOn: self
	
	"An array of rows. Each row is a collection of points."
	^rows
	self rows add: aCollection
	self newGame.
	timer ifNotNil: [timer clearInterval].
	timer := [self nextStep] valueWithInterval: speed
	movingPiece ifNil: [self newPiece].
	(movingPiece canMoveIn: self)
		ifTrue: [movingPiece position: movingPiece position + (0@1)]
		ifFalse: [self newPiece].
	self redraw
	
	renderingContext clearRectFrom: 0@ self width to: 0@ self height.
	self 
		drawMap;
		drawPiece
	renderingContext 
		fillStyle: '#fafafa';
		fillRectFrom: 0@0 to: self width@self height.
	renderingContext 
		lineWidth: 0.5;
		strokeStyle: '#999'.
	0 to: self class squares x do: [:each | | x |
		x := each * self class squareSize.
		self drawLineFrom: x@0 to: x@self height].
	0 to: self class squares y do: [:each | | y |
		y := each * self class squareSize.
		self drawLineFrom: 0@y to: self width@y].
	renderingContext 
		beginPath;
		moveTo: aPoint;
		lineTo: anotherPoint;
		stroke
	rows := #().
	movingPiece := nil.
	speed := 200.
	score := 0
	movingPiece := TetrisPiece atRandom
	self rows do: [:each |].
	movingPiece ifNotNil: [movingPiece drawOn: renderingContext]
	movingPiece ifNotNil: [
		movingPiece drawOn: renderingContext]
	super initialize.
	self newGame
	html div
		class: 'tetris';
		with: [
			html h3 with: 'Tetris'.
			self renderCanvasOn: html.
			self renderButtonsOn: html]
	| canvas |
	canvas := html canvas.
	canvas at: 'width' put: self width asString.
	canvas at: 'height' put: self height asString.
	renderingContext := CanvasRenderingContext tagBrush: canvas.
	self redraw
	html div 
		class: 'tetris_buttons';
		with: [
			html button
				with: 'New game';
				onClick: [self startNewGame].
			html button
				with: 'play/pause';
				onClick: [self update]]
	^22
	^self squareSize * (self squares x)
	^self squareSize * (self squares y)
	^10@15
	^rotation ifNil: [rotation := 1]
	rotation := aNumber
	^position ifNil: [(Tetris squares x / 2) -1 @ 0]
	^position := aPoint
	self subclassResponsibility
	^'#afa'
	^2
	aRenderingContext fillStyle: self color.
	self bounds do: [:each |
		aRenderingContext 
			fillRectFrom: each + self position* Tetris squareSize to: 1@1 * Tetris squareSize;
			strokeStyle: '#999';
			lineWidth: 2;
			strokeRectFrom: each + self position* Tetris squareSize to: 1@1 * Tetris squareSize]
	^self position y < (Tetris squares y - self height)
	^self position y < (aTetris squares y - self height)
	^(self subclasses at: self subclasses size atRandom) new
	^Array new
		add: 0@0;
		add: 0@1;
		add: 1@0;
		add: 1@1;
		yourself
	^Array new
		add: 0@0;
		add: 0@1;
		add: 0@2;
		add: 1@2;
		yourself
	^'#ffa'
	^3
	^'#aaf'
	^Array new
		add: 1@0;
		add: 1@1;
		add: 1@2;
		add: 0@2;
		yourself
	^3
	^'#faa'
	^Array new
		add: 0@0;
		add: 0@1;
		add: 0@2;
		add: 0@3;
		yourself
	^4
	^Array new
		add: 0@0;
		add: 1@0;
		add: 2@0;
		add: 1@1;
		yourself
	^'#aaf'