
# Initialization
[Question, Answer].each do |model_name|
  model_name.destroy_all
end
puts "***** Destroy all models    *****"
puts "----- Wait while processing -----"

# Questions
q1 = Question.create(title: "What do you want to organize ?", position: 1)
q2 = Question.create(title: "Who is the organizer ?", position: 2)
q3 = Question.create(title: "Is the agency under contract with Ubisoft ?", position: 3) # If Answer.order == 4
q4 = Question.create(title: "Choose the agency", position: 4) # If Answer.order == 4 && Answer.order == 5
q5 = Question.create(title: "How personal data are collected ?", position: 5)
q6 = Question.create(title: "Which data will be collected and processed ?", position: 6) # If Answer.order == 11 || Answer.order == 12
q7 = Question.create(title: "On which environment is the contest organized ?", position: 7)
q8 = Question.create(title: "Is the data shared publicly ?", position: 8)
q9 = Question.create(title: "For what purpose(s) will the data be reused", position: 9,
                     hint: "Please check only the usecases for which you will reuse the data collected about the entrants",
                     hint_icon: "<i class='fas fa-exclamation-triangle white'></i>")

puts "***** New questions created *****"

# Answers
Answer.create(label: "A contest",
              value: ",1,",
              hint: nil,
              hint_header: nil,
              answer_type: "radio",
              order: 1,
              parameter: "type_of_operation",
              question: q1)

Answer.create(label: "An event",
              value: ",2,",
              hint: nil,
              hint_header: nil,
              answer_type: "radio",
              order: 2,
              parameter: "type_of_operation",
              question: q1)

Answer.create(label: "Ubisoft",
              value: ",3,",
              hint: nil,
              hint_header: nil,
              answer_type: "radio",
              order: 3,
              parameter: "organizer",
              question: q2)

Answer.create(label: "An external agency",
              value: ",4,",
              hint: nil,
              hint_header: nil,
              answer_type: "radio",
              order: 4,
              parameter: "organizer",
              question: q2)

Answer.create(label: "Yes",
              value: ",5,",
              hint_about_request: "If the contest is organized by an external agency, <span class='orange'>please make a request</span>.",
              hint_header: "<span class='orange'>It's request time</span>",
              hint_icon: "<i class='fas fa-sync-alt white'></i>",
              answer_type: "radio",
              order: 5,
              parameter: "organizer_under_contract",
              question: q3)

Answer.create(label: "No",
              value: ",6,",
              hint_about_request: "If the contest is organized by an external agency which is not under contract with Ubisoft, <span class='orange'>please make a request</span>.",
              hint_header: "<span class='orange'>It's request time</span>",
              hint_icon: "<i class='fas fa-sync-alt white'></i>",
              answer_type: "radio",
              order: 6,
              parameter: "organizer_under_contract",
              question: q3)

Answer.create(label: "Agency 1",
              value: ",7,",
              hint: nil,
              hint_header: nil,
              answer_type: "radio",
              order: 7,
              parameter: "agency_name",
              question: q4)

Answer.create(label: "Agency 2",
              value: ",8,",
              hint: nil,
              hint_header: nil,
              answer_type: "radio",
              order: 8,
              parameter: "agency_name",
              question: q4)

Answer.create(label: "Other",
              value: ",9,",
              hint: nil,
              hint_header: nil,
              answer_type: "radio",
              order: 9,
              parameter: "agency_name",
              question: q4)

Answer.create(label: "Directly",
              value: ",10,",
              hint: "Ubisoft uses data that entered directly via a form.",
              hint_header: "Directly",
              answer_type: "radio",
              order: 10,
              parameter: "collected_data",
              question: q5)

Answer.create(label: "Indirectly",
              value: ",11,",
              hint: "Ubisoft uses data that already exist in its data bases. (eg : in game data)",
              hint_header: "Indirectly",
              answer_type: "radio",
              order: 11,
              parameter: "collected_data",
              question: q5)

Answer.create(label: "Both",
              value: ",12,",
              hint: nil,
              hint_header: nil,
              answer_type: "radio",
              order: 12,
              parameter: "collected_data",
              question: q5)

# Get the value from the form
Answer.create(label: nil,
              hint: "Tag the collected and processed data below and PRESS ENTER",
              hint_header: nil,
              answer_type: "text",
              order: 13,
              parameter: "data_tag",
              question: q6)

Answer.create(label: "Ubisoft environment",
              value: ",14,",
              hint: "The Ubisoft environment includes all Ubisoft websites.",
              hint_header: "Ubisoft environment",
              answer_type: "radio",
              order: 14,
              parameter: "environment",
              question: q7)

Answer.create(label: "In-game",
              value: ",15,",
              hint: nil,
              hint_header: nil,
              answer_type: "radio",
              order: 15,
              parameter: "environment",
              question: q7)

Answer.create(label: "Third party environment",
              value: ",16,",
              hint: "When the is organized on external partner's platform.",
              hint_header: "Third party environment",
              answer_type: "radio",
              order: 16,
              parameter: "environment",
              question: q7)

Answer.create(label: "Social Networks",
              value: ",17,",
              hint: nil,
              hint_header: nil,
              answer_type: "radio",
              order: 17,
              parameter: "environment",
              question: q7)

Answer.create(label: "Yes",
              value: ",18,",
              hint: "The data will be shared publicly on all media in relatin with the contest.",
              hint_header: "Publicly shared",
              answer_type: "radio",
              order: 18,
              parameter: "shared_data",
              question: q8)

Answer.create(label: "No",
              value: ",19,",
              hint: "The data will be only shared with Ubisoft teams and partners.",
              hint_header: "Not publicly shared",
              answer_type: "radio",
              order: 19,
              parameter: "shared_data",
              question: q8)

Answer.create(label: "To create in-game content",
              value: ",20,",
              hint: nil,
              hint_header: nil,
              answer_type: "checkbox",
              order: 20,
              parameter: "reused_data",
              question: q9)

Answer.create(label: "To create promotional and marketing content",
              value: ",21,",
              hint: nil,
              hint_header: nil,
              answer_type: "checkbox",
              order: 21,
              parameter: "reused_data",
              question: q9)

Answer.create(label: "To send customer satisfaction survey",
              value: ",22,",
              hint: nil,
              hint_header: nil,
              answer_type: "checkbox",
              order: 22,
              parameter: "reused_data",
              question: q9)

Answer.create(label: "To conduct analytics about user experience",
              value: ",23,",
              hint: nil,
              hint_header: nil,
              answer_type: "checkbox",
              order: 23,
              parameter: "reused_data",
              question: q9)

Answer.create(label: "To send promotional offers",
              value: ",24,",
              hint: nil,
              hint_header: nil,
              answer_type: "checkbox",
              order: 24,
              parameter: "reused_data",
              question: q9)

Answer.create(label: "Other",
              value: ",25,",
              hint_about_request: "If the usecases is <br>other<br>, <span class='orange'>please make a request</span>.",
              hint_header: "<span class='orange'>It's request time</span>",
              hint_icon: "<i class='fas fa-sync-alt white'></i>",
              answer_type: "checkbox",
              order: 25,
              parameter: "reused_data",
              question: q9)

puts "***** New answers created *****"
puts "----- New models created  -----"
