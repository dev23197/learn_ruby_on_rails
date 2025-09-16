class LyricController < ApplicationController
  include AvtionController::Live

  def show
    response.headers["Content-Type"] = "text/event-stream"
    response.headers["Cache-Control"] = "no-cache"


    song = Song.find(params[:id])


    song.each do |line|
      response.stream.write line.lyric
      sleep line.num_beats
    end
  ensure
    response.stream.close
  end
end
