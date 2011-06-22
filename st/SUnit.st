Object subclass: #TestCase
	^testedClass
	testedClass := aClass
	self class instanceVariableNames do: [ :name |
		name = 'testSelector' ifFalse: [
			self instVarAt: name put: nil ]]
	TestFailure new
		messageText: aString;
		signal
	^self class methodDictionary keys select: [:each | each match: '^test']
	[self setUp.
	self performTestFor: aTestResult]
		on: Error
		do: [:ex |
			self tearDown.
			self cleanUpInstanceVariables.
			ex signal].
	self tearDown.
	self cleanUpInstanceVariables
	self methods do: [:each | 
		[[self perform: each]
			on: TestFailure do: [:ex | aResult addFailure: self class name, '>>', each]]
			on: Error do: [:ex | aResult addError: self class name, '>>', each].
		aResult increaseRuns]
	aBoolean ifFalse: [self signalFailure: 'Assertion failed']
	self assert: aBoolean not
	self deny: true
	
	100000 timesRepeat: [self assert: 1 + 1 = 2]
	self assert: 1 foo
	^percent ifNil: [0]
	percent := aNumber
	html div 
		class: 'progress_bar';
		with: [
			html div 
				class: 'progress';
				style: 'width:', self percent asString, '%']
	self percent: aNumber.
	self update
    ^'[Test runner]'

    | categories |
    categories := Array new.
    self allClasses do: [:each |
	(categories includes: each category) ifFalse: [
	    categories add: each category]].
    ^categories sort
    ^(self allClasses 
	select: [:each | self selectedCategories includes: each category])
	sort: [:a :b | a name > b name]
	^selectedCategories ifNil: [selectedCategories := Array new]
	^TestCase allSubclasses
	^selectedClasses  ifNil: [selectedClasses := Array new]
	^progressBar ifNil: [progressBar := ProgressBar new]
	^selectedMethods ifNil: [self selectedClasses collect: [:each |
		each methodDictionary keys select: [:key |  key beginsWith: 'test' ]]]
	^self printTotal, self printPasses, self printErrors, self printFailures
	^result
	self result failures collect: [:each |
		html li 
			class: 'failures';
			with: each]
	self categories do: [:each | 
		(selectedCategories includes: each) ifFalse: [
			self selectedCategories add: each]].
	self 
	    updateCategoriesList;
	    updateClassesList
	(self isSelectedCategory: aCategory) 
		ifFalse: [selectedCategories add: aCategory]
		ifTrue: [selectedCategories remove: aCategory].
	self 
	    updateCategoriesList;
	    updateClassesList
	(self isSelectedClass: aClass) 
		ifFalse: [selectedClasses add: aClass]
		ifTrue: [selectedClasses remove: aClass].
	self 
	    updateClassesList
	self classes do: [:each | 
		(selectedClasses includes: each) ifFalse: [
			self selectedClasses add: each]].
	self 
	    updateCategoriesList;
	    updateClassesList
	result := TestResult new.
	self 
		updateStatusDiv;
		updateMethodsList.
	self progressBar updatePercent: 0.
	result total: (aCollection inject: 0 into: [:acc :each | acc + each methods size]).
	aCollection do: [:each | 
		[each runCaseFor: result.
		self progressBar updatePercent: result runs / result total * 100.
		self updateStatusDiv.
		self updateMethodsList] valueWithTimeout: 100].
	super initialize.
	result := TestResult new
	^self result errors size asString , ' errors, '
	^self result failures size asString, ' failures'
	^(((self result total) - (self result errors size + (self result failures size))) asString) , ' passes, '
	^self result total asString, ' runs, '
    self 
	renderCategoriesOn: html;
	renderClassesOn: html;
	renderResultsOn: html
    html button
	with: 'Run selected';
	onClick: [self run: (self selectedClasses collect: [:each | each new])]

    	categoriesList := html ul class: 'jt_column sunit categories'.
	self updateCategoriesList
    	classesList := html ul class: 'jt_column sunit classes'.
	self updateClassesList
    	statusDiv := html div.
	html with: self progressBar.
   	methodsList := html ul class: 'jt_column sunit methods'.
	self updateMethodsList.
	self updateStatusDiv
	self result failures do: [:each |
		html li 
			class: 'failures';
			with: each]
	self result errors do: [:each |
		html li 
			class: 'errors';
			with: each]
    ^true

	^(self selectedClasses includes: aClass)
	^(self selectedCategories includes: aCategory)
    categoriesList contents: [:html |
	    html li 
		class: 'all';
		with: 'All';
		onClick: [self selectAllCategories].
	self categories do: [:each || li |
	    li := html li.
	    (self selectedCategories includes: each) ifTrue: [
		li class: 'selected'].
	    li
		with: each;
		onClick: [self toggleCategory: each]]]
    classesList contents: [:html |
	(self selectedCategories isEmpty) ifFalse: [
		html li
			class: 'all';
			with: 'All';
			onClick: [self selectAllClasses]].
	self classes do: [:each || li |
		li := html li.
		(self selectedClasses includes: each) ifTrue: [
			li class: 'selected'].
		li
			with: each name;
			onClick: [self toggleClass: each]]]
	methodsList contents: [:html |
		self renderFailuresOn: html.
                self renderErrorsOn: html]
	statusDiv class: 'sunit status ', result status.
	statusDiv contents: [:html |
		html span with: self statusInfo]
	^timestamp
	^errors
	^failures
	^total
	total := aNumber
	self errors add: anError
	self failures add: aFailure
	^runs
	runs := runs + 1
	^self errors isEmpty 
		ifTrue: [
			self failures isEmpty 
				ifTrue: ['success']
				ifFalse: ['failure']]
		ifFalse: ['error']
	super initialize.
	timestamp := Date now.
	runs := 0.
	errors := Array new.
	failures := Array new.
	total := 0
	100000 timesRepeat: [self assert: 1 + 1 = 2]
	100000 timesRepeat: [self assert: 1 + 1 = 2]