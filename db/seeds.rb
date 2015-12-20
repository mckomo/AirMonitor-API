require 'csv'

unless User.exists?(email: 'mckomo@gmail.com')

  puts 'Initial seed'

  user = User.create!({ name: 'Mckomo', email: 'mckomo@gmail.com', password: 'passwordToChange' })

  stations = Station.create!([
    { name: 'Kraków, Aleja Krasińskiego', code: 'PL0012A', latitude: 50.057678, longitude: 19.926189, user_id: user.id },
    { name: 'Kraków, Bujaka', code: 'PL0501A', latitude: 50.010575, longitude: 19.949189, user_id: user.id },
    { name: 'Kraków, Nowa Huta', code: 'PL0039A', latitude: 50.069308, longitude: 20.053492, user_id: user.id }
  ])

  subjects = Subject.create!([
    { code: 'NO2', name: 'Dwutlenek azotu', unit: 'µg/m<sup>3</sup>' },
    { code: 'NOx', name: 'Tlenki azotu', unit: 'µg/m<sup>3</sup>'},
    { code: 'NO', name: 'Tlenk azotu', unit: 'µg/m<sup>3</sup>'},
    { code: 'CO', name: 'Tlenek węgla', unit: 'µg/m<sup>3</sup>' },
    { code: 'PM10', name: 'Pył zawieszony PM10', unit: 'µg/m<sup>3</sup>' },
    { code: 'PM2.5', name: 'Pył zawieszony P2.5', unit: 'µg/m<sup>3</sup>'},
  ])

  norms = Norm.create!([
    { subject: Subject.find_by(code: 'NO2'), level: 0, value: 200, interval: '1 hour' },
    { subject: Subject.find_by(code: 'NO2'), level: 2, value: 400, interval: '1 hour' },
    { subject: Subject.find_by(code: 'NO2'), level: 0,  value: 40, interval: '1 year' },
    { subject: Subject.find_by(code: 'CO'), level: 0, value: 10 * 1000, interval: '8 hours' },
    { subject: Subject.find_by(code: 'CO'), level: 0, value: 5, interval: '1 year' },
    { subject: Subject.find_by(code: 'PM10'), level: 0, value: 50, interval: '1 day' },
    { subject: Subject.find_by(code: 'PM10'), level: 1, value: 200, interval: '1 day' },
    { subject: Subject.find_by(code: 'PM10'), level: 2, value: 300, interval: '1 day' },
    { subject: Subject.find_by(code: 'PM2.5'), level: 0, value: 25, interval: '1 year' },
  ])


  CSV.read('db/fixtures/measurements-2015-12-10.csv', col_sep: ';').drop(1).each do |row|

    time, no2, nox, no, co, pm10, pm25 = row

    measurement_header = {
       source: 'http://monitoring.krakow.pios.gov.pl',
       time: DateTime.parse("#{time} #{Time.now.strftime('%F')}"),
       station: Station.find_by(code: 'PL0012A'),
       user: user
    }

    Measurement.create!([
      measurement_header.merge({ subject: Subject.find_by(code: 'NO2'), value: no2 }),
      measurement_header.merge({ subject: Subject.find_by(code: 'NOx'), value: nox }),
      measurement_header.merge({ subject: Subject.find_by(code: 'NO'), value: no }),
      measurement_header.merge({ subject: Subject.find_by(code: 'CO'), value: co }),
      measurement_header.merge({ subject: Subject.find_by(code: 'PM10'), value: pm10 }),
      measurement_header.merge({ subject: Subject.find_by(code: 'PM2.5'), value: pm25 })
    ])

  end

else

  puts 'Seeding with random measurements'

  no2 = rand(0 .. 300)
  nox = rand(0 .. 1000)
  no = rand(0 .. 700)
  co = rand(0 .. 12000)
  pm10 = rand(0 .. 400)
  pm25 = rand(0 .. 300)

  measurement_header = {
       source: 'http://monitoring.krakow.pios.gov.pl',
       time: Time.now,
       station: Station.where(code: 'PL0012A').take,
       user: User.where(email: 'mckomo@gmail.com').take
   }

  Measurement.create!([
      measurement_header.merge({ subject: Subject.find_by(code: 'NO2'), value: no2 }),
      measurement_header.merge({ subject: Subject.find_by(code: 'NOx'), value: nox }),
      measurement_header.merge({ subject: Subject.find_by(code: 'NO'), value: no }),
      measurement_header.merge({ subject: Subject.find_by(code: 'CO'), value: co }),
      measurement_header.merge({ subject: Subject.find_by(code: 'PM10'), value: pm10 }),
      measurement_header.merge({ subject: Subject.find_by(code: 'PM2.5'), value: pm25 })
  ])

end



