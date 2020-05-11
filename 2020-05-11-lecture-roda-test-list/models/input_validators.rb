# Validators for the incoming requests
module InputValidators
  def self.check_date_description(raw_date, raw_description)
    date = raw_date || ''
    description = raw_description || ''
    errors = []
    errors.concat(check_date_format(date)) unless date.empty?
    {
      date: date,
      description: description, 
      errors: errors
    }
  end

  def self.check_date_format(date)
    unless /\d{4}-\d{2}-\d{2}/ =~ date
      ["Дата должна быть передана в формате ГГГГ-ММ-ДД"]
    else
      []
    end
  end
end
