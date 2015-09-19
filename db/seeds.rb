# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
1.times do
  Shift.create([
  {
      start: '5:45',
      end: '11:00',
      active_days: 'Saturday,Sunday',
      manager_only: false
  },
  {
      start: '5:45',
      end: '12:30',
      active_days: 'Monday,Tuesday,Wednesday,Thursday,Friday',
      manager_only: false
  },
  {
      start: '9:00',
      end: '13:00',
      active_days: 'Saturday',
      manager_only: false
  },
  {
      start: '8:00',
      end: '17:30',
      active_days: 'Saturday,Sunday',
      manager_only: true
  },
  {
      start: '12:30',
      end: '16:30',
      active_days: 'Wednesday',
      manager_only: false
  },
  {
      start: '12:30',
      end: '20:30',
      active_days:  'Monday,Tuesday,Wednesday,Thursday,Friday',
      manager_only: false
  },
  {
      start: '16:00',
      end: '21:30',
      active_days: 'Monday',
      manager_only: false
  },
  {
      start: '16:30',
      end: '22:00',
      active_days: 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',
      manager_only: false
  }])

  #employees

  Employee.create({
    name: 'Monica',
    position_title: 'Front End',
    is_manager: false,
    mon_start: '5:00',
    mon_end: '22:00',
    tues_start: nil,
    tues_end: nil,
    wed_start: nil,
    wed_end: nil,
    thurs_start: '5:00',
    thurs_end: '22:30',
    fri_start: nil,
    fri_end: nil,
    sat_start: '5:00',
    sat_end: '22:30',
    sun_start: nil,
    sun_end: nil,
  })

  Employee.create({
      name: 'Yareli',
      position_title: 'Front End',
      is_manager: false,
      mon_start: nil,
      mon_end: nil,
      tues_start: '5:00',
      tues_end: '22:30',
      wed_start: nil,
      wed_end: nil,
      thurs_start: '5:00',
      thurs_end: '13:00',
      fri_start: '5:00',
      fri_end: '22:30',
      sat_start: '5:00',
      sat_end: '22:30',
      sun_start: nil,
      sun_end: nil,
  })


  Employee.create({
        name: 'Melissa',
        position_title: 'Front End',
        is_manager: true,
        mon_start: '12:00',
        mon_end: '21:00',
        tues_start: nil,
        tues_end: nil,
        wed_start: nil,
        wed_end: nil,
        thurs_start: '12:00',
        thurs_end: '21:00',
        fri_start: '12:00',
        fri_end: '21:00',
        sat_start: '8:00',
        sat_end: '18:00',
        sun_start: '5:00',
        sun_end: '14:00',
  })

  Employee.create({
        name: 'Gabby',
        position_title: 'Front End',
        is_manager: true,
        mon_start: '5:00',
        mon_end: '13:00',
        tues_start: '12:00',
        tues_end: '21:00',
        wed_start: '16:30',
        wed_end: '22:00',
        thurs_start: nil,
        thurs_end: nil,
        fri_start: nil,
        fri_end: nil,
        sat_start: '5:00',
        sat_end: '11:00',
        sun_start: nil,
        sun_end: nil,
  })

  Employee.create({
        name: 'Taqqisha',
        position_title: 'Front End',
        is_manager: false,
        mon_start: nil,
        mon_end: nil,
        tues_start: '16:00',
        tues_end: '22:30',
        wed_start: '12:00',
        wed_end: '21:00',
        thurs_start: '16:00',
        thurs_end: '22:30',
        fri_start: nil,
        fri_end: nil,
        sat_start: '9:00',
        sat_end: '13:00',
        sun_start: nil,
        sun_end: nil,
    })

  Employee.create({
        name: 'Amber',
        position_title: 'Front End',
        is_manager: false,
        mon_start: nil,
        mon_end: nil,
        tues_start: nil,
        tues_end: nil,
        wed_start: nil,
        wed_end: nil,
        thurs_start: nil,
        thurs_end: nil,
        fri_start: '16:00',
        fri_end: '22:00',
        sat_start: nil,
        sat_end: nil,
        sun_start: '8:00',
        sun_end: '18:00',
    })

  Employee.create({
      name: 'Sandra',
      position_title: 'Front End',
      is_manager: false,
      mon_start: nil,
      mon_end: nil,
      tues_start: nil,
      tues_end: nil,
      wed_start: nil,
      wed_end: nil,
      thurs_start: nil,
      thurs_end: nil,
      fri_start:  nil,
      fri_end:  nil,
      sat_start: '16:30',
      sat_end: '22:00',
      sun_start: '16:30',
      sun_end: '22:00',
  })


end
