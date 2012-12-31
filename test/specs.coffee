describe 'datetimepicker', ->

  beforeEach setupDateTimePicker()

  afterEach teardownDateTimePicker()

  # Helper to debug in browser
  # after setupDateTimePicker()

  it 'starts with date value parsed from input value', ->
    expect(@picker.date.getTime()).to.equal Date.UTC(1905, 4, 1, 21, 52, 14)
    expect(@widget.find('.datepicker .day.active').html()).to.equal('1')
    expect(@widget.find('.datepicker .month.active').html()).to.equal('May')
    expect(@widget.find('.datepicker .year.active').html()).to.equal('1905')
    expect(@widget.find('.timepicker .timepicker-hour').html()).to.equal('21')
    expect(@widget.find('.timepicker .timepicker-minute').html()).to.equal('52')
    expect(@widget.find('.timepicker .timepicker-second').html()).to.equal('14')

  it 'creates an invisible widget on body', ->
    expect(@widget.length).to.equal 1
    expect(@widget.is ':hidden').to.be.true

  it 'pops up the widget when icon is clicked', ->
    @addon.click()
    expect(@widget.is ':visible').to.be.true

  it 'hides the widget when clicking outside it', ->
    @addon.click()
    $('#mocha').mousedown()
    expect(@widget.is ':hidden').to.be.true

  it 'does not hide widget when clicking inside it', ->
    @addon.click()
    @widget.find('.datepicker .day:contains(18)').click()
    expect(@widget.find('.datepicker .day:contains(18)').is '.active')
      .to.be.true
    expect(@widget.is ':visible').to.be.true
