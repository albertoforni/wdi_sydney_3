class Mta
  constructor: () ->
    @_lines = ["n", "l", "6"]

    @_stations =
      n: ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
      l: ["8th", "6th", "Union Square", "3rd", "1st"],
      6: ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]

    @_conjunctions =
      "Union Square": ["n", "l", "6"]

  getStationsInBetween: (startIndex, endIndex, currentLineStops) ->
    arr = []
    if startIndex < endIndex
      while startIndex < endIndex
        arr.push(currentLineStops[startIndex + 1])
        startIndex += 1
    else if startIndex > endIndex
      while startIndex > endIndex
        arr.push(currentLineStops[startIndex - 1])
        startIndex -= 1
    else
      return arr

    #remove the station from which you're getting in
    arr.shift
    arr

  stationsConjunctions: (line1, line2) ->
    for conjunction, stops of @_conjunctions
      if stops.indexOf(line1) != -1 && stops.indexOf(line2) != -1
        return conjunction

    return null

  calculateTravel: (startLine, startStation, endLine, endStation) ->
    arr = []
    if startLine == endLine
      # you don't need to change
      currentLineStops = @_stations[startLine]

      # find the index of the station in which you get in and in which you get out
      start_index = currentLineStops.indexOf(startStation)
      end_index = currentLineStops.indexOf(endStation)

      arr = @getStationsInBetween(start_index, end_index, currentLineStops)
    else
      # you need to change

      start_line_stations = @_stations[startLine]
      end_line_stations = @_stations[endLine]

      # find the station in which you need to change train
      change_station = @stationsConjunctions(startLine, endLine)

      return if change_station == null

      # find the index of the station in which you need to change train in the first and in the second line
      change_index_start_line = start_line_stations.indexOf(change_station)
      change_index_end_line = end_line_stations.indexOf(change_station)

      # find the index of the station in which you get in and in which you get out of the train
      start_index = start_line_stations.indexOf(startStation)
      end_index = end_line_stations.indexOf(endStation)

      # get the path from the first to the change station
      arr = @getStationsInBetween(start_index, change_index_start_line, start_line_stations)

      # get the path from the change to the last station
      arr = arr.concat @getStationsInBetween(change_index_end_line, end_index, end_line_stations)

    arr.unshift()

    console.log(arr)

  mta = new Mta;
  mta.calculateTravel('n', '34th', 'n', '8th')
  mta.calculateTravel('n', '34th', 'l', '3rd')
  mta.calculateTravel('6', 'Grand Central', 'l', '3rd')
  mta.calculateTravel('6', 'Grand Central', 'l', '8th')
  mta.calculateTravel('6', 'Grand Central', 'l', '1st')