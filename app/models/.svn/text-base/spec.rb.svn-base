class Spec < ActiveRecord::Base
  include GeoKit::Geocoders
  acts_as_ferret :remote => true
  belongs_to :account
  validates_presence_of :birth_date, :message => 'Bitte Geburtsdatum angeben'
  
  
  BODY_TYPES = %w(dürre dünn schlank normal athletisch kräftig mollig propper superpropper)
  BODY_HAIR_TYPES = %w(keine etwas stark)
  EYE_COLORS = %w(blau grau grün braun blau-grau grau-grün blau-grün gelb)
  HAIR_COLORS = %w(blond dunkelblond schwarz grau braun rot grün blau andere)
  HAIR_LENGTHS = %w(Glatze kurz mittel lang)
  SEXUALITIES = %w(hetero homo bi)
  PUBIC_HAIR_TYPES = %w(naturbelassen unrasiert teilrasiert rasiert)
  GENDERS = %w(Mann Frau TV/DWT TS)
  BREAST_CUPS = %w(A B C D E F)
  
  START_YEAR = 1920
  
  def complete?
    true
  end
  
  def age
    (Time.now.to_date - birth_date).to_i / 365
  end
  
  def location
    if latitude == 0 || longitude == 0
      location = MultiGeocoder.geocode(zip_code + ' ' + city + ' ,Germany')
      latitude = location.lat
      longitude = location.lng
      save!
    end
    [latitude, longitude]
  end
end
