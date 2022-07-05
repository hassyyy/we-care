module AppOptions
  MONTHS = Date::ABBR_MONTHNAMES.drop(1).freeze
  MIN_YEAR = 2017.freeze
  YEARS = Array(MIN_YEAR..Date.today.year).freeze
end
