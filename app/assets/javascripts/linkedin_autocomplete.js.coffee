# Linked in style autocomplete
splitList = (val) ->
  val.split /,\s*/

extractLast = (term) ->
  splitList(term).pop()

filterNameList = (cssId, requestTerm) ->
  resultsArray = []
  if extractLast(requestTerm)
    names = []
    $.each $(cssId).data("names"), (i, item) ->
      names.push item.name

    filteredNames = $.ui.autocomplete.filter(names, extractLast(requestTerm))
    $.each $(cssId).data("names"), (i, item) ->
      resultsArray.push item  if $.inArray(item.name, filteredNames) > -1

  resultsArray


#renders appropriately for circle or user
autoRenderLi = (ul, item) ->
  person = undefined
  if item.hasOwnProperty("email")
    person = "<a style='font-size: 10px;'><img style='float: left; margin: 4px 10px 4px 4px;height:35px;width:35px;' src='http://placehold.it/40/" + item.picture + "' //><strong>" + item.name + "</strong><br/>" + item.email + "<br/><em>" + item.company + "<em/></a>"
  else
    person = "<a style='font-size: 10px;'><strong>" + item.name + "</strong><br/></a>"
  $("<li></li>").data("item.autocomplete", item).append(person).appendTo ul

$ ->
  if $("#auto-who-with").length > 0
    # add placeholder to get the comma-and-space at the end
    $("#auto-who-with").bind("keydown", (event) ->
      event.preventDefault()  if event.keyCode is $.ui.keyCode.TAB and $(this).data("autocomplete").menu.active
    ).autocomplete(
      minLength: 0
      source: (request, response) ->
        response filterNameList("#auto-who-with", request.term)

      focus: ->
        false

      select: (event, ui) ->
        terms = splitList(@value)
        terms.pop()
        terms.push ui.item.name
        terms.push ""
        @value = terms.join(", ")
        false
    ).data("autocomplete")._renderItem = (ul, item) ->
      autoRenderLi ul, item
