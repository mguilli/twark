module WebAppsHelper

  def group_events_by_date(events, type)
    events.where(name: type).order(:created_at).group(:created_at).count
  end

  def ChartData(events, type)

    data = {}

    # Convert :created_at values to dates and propogate @data hash
    group_events_by_date(events, type).each do |key, value|
      
      if data.has_key?(key.to_date)
        data[key.to_date] += value
      else
        data[key.to_date] = value
      end
    end

    # Use first and last ordered keys from data hash to generate date range
    # Use to limit chart timeline:
      # date_range = ((data.keys.last - 1.month) .. data.keys.last).to_a 
    date_range = (data.keys.first .. data.keys.last).to_a

    # Check for events by date and fill value range with event count data
    value_range = []

    date_range.each do |date|
      if data.has_key?(date)
        value_range << data[date]
      else
        value_range << 0
      end
    end

    # Convert date range to chart friendly format
    date_range.map! do |date|
      date.strftime("%m-%d-%Y")
    end

    label_val_array = [date_range, value_range]   
  end
end
