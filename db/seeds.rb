# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

q1 = Question.create(label: 'First Name', content: 'What is your first name?')
q2 = Question.create(label: 'Last Name', content: 'What is your last name?')
q3 = Question.create(label: 'Email', content: 'What is your email address?')

template = Template.create(name: 'Seed Template', content: "This is a test document.

  Welcome {{@#{q1.id}}} {{@#{q2.id}}}

  You should receive an email confirmation at {{@#{q3.id}}} within a few minutes.")

template.questions = [q1, q2, q3]
template.save
