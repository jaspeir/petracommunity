class MapTestController < ApplicationController
  def index
    @map = GMap.new("map_div")
    @map.control_init(:large_map => false,:map_type => false)
    @map.center_zoom_init([50.981046742759794,11.33063793182373],7)
    @map.overlay_init(GMarker.new([50.98104,11.33063],
                                    :title => "Home", 
                                    :info_window => "site"))
  end
end
