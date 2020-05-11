# frozen_string_literal: true

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
    if /\d{4}-\d{2}-\d{2}/ =~ date
      []
    else
      ['Дата должна быть передана в формате ГГГГ-ММ-ДД']
    end
  end

  def self.check_test(raw_name, raw_date, raw_description)
    name = raw_name || ''
    date = raw_date || ''
    description = raw_description || ''
    errors = [].concat(check_name(name))
               .concat(check_date(date))
               .concat(check_date_format(date))
    {
      name: name,
      date: date,
      description: description,
      errors: errors
    }
  end

  def self.check_name(name)
    if name.empty?
      ['Имя теста не может быть пустым']
    else
      []
    end
  end

  def self.check_date(date)
    if date.empty?
      ['Дата не может быть пустой']
    else
      []
    end
  end
end
