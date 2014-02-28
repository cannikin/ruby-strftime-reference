RubyStrftimeReferenceView = null

module.exports =
  activate: ->
    atom.workspaceView.command 'ruby-strftime-reference:toggle', =>
      RubyStrftimeReferenceView ?= require './ruby-strftime-reference-view'
      new RubyStrftimeReferenceView()

  deactivate: ->
