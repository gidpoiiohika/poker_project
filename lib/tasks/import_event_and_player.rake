namespace :import_event_and_player do
  task create_event_and_player: :environment do
    session = GoogleDrive::Session.from_service_account_key("client_secret.json")
    spreadsheet = session.spreadsheet_by_title("Poker tournaments data structure")
    worksheets = spreadsheet.worksheets.first

    event_name_one = worksheets.rows[1].first
    event_name_second = worksheets.rows[11].first
    event_name_third = worksheets.rows[26].first
    event_name_fourth = worksheets.rows[36].first

    event_fields_one = worksheets.rows[2].drop(2).push(event_name_one)
    event_fields_second = worksheets.rows[12].drop(2).push(event_name_second)
    event_fields_third = worksheets.rows[27].drop(2).push(event_name_third)
    event_fields_fourth = worksheets.rows[37].drop(2).push(event_name_fourth)

    event_fields = []

    event_fields.push(event_fields_one, event_fields_second, event_fields_third, event_fields_fourth)

    event_fields.each do |field|
      prize_pool_field_event = field[1].gsub('$', '').delete ','
      buy_in_pool_field_event = field[2].gsub('$', '').delete ','
      event = Event.create(points_qual: field[0], prize_pool: prize_pool_field_event, buy_in: buy_in_pool_field_event, entrants: field[3], date: Date.strptime(field[4], "%m/%d/%y"), name: field[5])

      players = if field[5].include? event_name_one
                  worksheets.rows[3..9].map { |c| c.reject { |c| c.empty? } }.map { |c| c.push(event.id)}
                elsif field[5].include? event_name_second
                  worksheets.rows[13..24].map { |c| c.reject { |c| c.empty? } }.map { |c| c.push(event.id)}
                elsif field[5].include? event_name_third
                  worksheets.rows[28..34].map { |c| c.reject { |c| c.empty? } }.map { |c| c.push(event.id)}
                else
                  worksheets.rows[38..45].map { |c| c.reject { |c| c.empty? } }.map { |c| c.push(event.id)}
                end

      players.each do |field|
        prize_pool_field_player = field[3].gsub('$', '').delete ','
        Player.create(place: field[0], full_name: field[1], points_qual: field[2], prize_pool: prize_pool_field_player, event_id: field[4])
      end
    end
  end
end
