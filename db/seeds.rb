
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
              modal_content: nil,
              modal_header: nil,
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "radio",
              order: 1,
              parameter: "type_of_operation",
              question: q1)

Answer.create(label: "An event",
              value: ",2,",
              modal_content: nil,
              modal_header: nil,
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "radio",
              order: 2,
              parameter: "type_of_operation",
              question: q1)

Answer.create(label: "Ubisoft",
              value: ",3,",
              modal_content: nil,
              modal_header: nil,
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "radio",
              order: 3,
              parameter: "organizer",
              question: q2)

Answer.create(label: "An external agency",
              value: ",4,",
              modal_content: nil,
              modal_header: nil,
              modal_request: true,
              modal_request_content: "If the contest is organized by an external agency, <span class='orange'>please make a request</span>.",
              modal_request_header: "<span class='orange'>It's request time</span>",
              modal_request_icon: "<i class='fas fa-sync-alt white'></i>",
              answer_type: "radio",
              order: 4,
              parameter: "organizer",
              question: q2)

Answer.create(label: "Yes",
              value: ",5,",
              modal_content: nil,
              modal_header: nil,
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "radio",
              order: 5,
              parameter: "organizer_under_contract",
              question: q3)

Answer.create(label: "No",
              value: ",6,",
              modal_content: nil,
              modal_header: nil,
              modal_request: true,
              modal_request_content: "If the contest is organized by an external agency which is not under contract with Ubisoft, <span class='orange'>please make a request</span>.",
              modal_request_header: "<span class='orange'>It's request time</span>",
              modal_request_icon: "<i class='fas fa-sync-alt white'></i>",
              answer_type: "radio",
              order: 6,
              parameter: "organizer_under_contract",
              question: q3)

Answer.create(label: "Agency 1",
              value: ",7,",
              modal_content: nil,
              modal_header: nil,
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "radio",
              order: 7,
              parameter: "agency_name",
              question: q4)

Answer.create(label: "Agency 2",
              value: ",8,",
              modal_content: nil,
              modal_header: nil,
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "radio",
              order: 8,
              parameter: "agency_name",
              question: q4)

Answer.create(label: "Other",
              value: ",9,",
              modal_content: nil,
              modal_header: nil,
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "radio",
              order: 9,
              parameter: "agency_name",
              question: q4)

Answer.create(label: "Directly",
              value: ",10,",
              modal: true,
              modal_content: "Ubisoft uses data that the entrant entered directly via a form.",
              modal_header: "Directly",
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "radio",
              order: 10,
              parameter: "collected_data",
              question: q5)

Answer.create(label: "Indirectly",
              value: ",11,",
              modal: true,
              modal_content: "Ubisoft uses data that already exist in its data bases. (eg : in game data)",
              modal_header: "Inirectly",
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "radio",
              order: 11,
              parameter: "collected_data",
              question: q5)

Answer.create(label: "Both",
              value: ",12,",
              modal_content: nil,
              modal_header: nil,
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "radio",
              order: 12,
              parameter: "collected_data",
              question: q5)

# Get the value from the form
Answer.create(label: "Tag the collected and processed data below and PRESS ENTER",
              modal_content: nil,
              modal_header: nil,
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "text",
              order: 13,
              parameter: "data_tag",
              question: q6)

Answer.create(label: "Ubisoft environment",
              value: ",14,",
              modal: true,
              modal_content: "The Ubisoft environment includes all Ubisoft websites.",
              modal_header: "Ubisoft environment",
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "radio",
              order: 14,
              parameter: "environment",
              question: q7)

Answer.create(label: "In-game",
              value: ",15,",
              modal_content: nil,
              modal_header: nil,
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "radio",
              order: 15,
              parameter: "environment",
              question: q7)

Answer.create(label: "Third party environment",
              value: ",16,",
              modal: true,
              modal_content: "When the is organized on external partner's platform.",
              modal_header: "Third party environment",
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "radio",
              order: 16,
              parameter: "environment",
              question: q7)

Answer.create(label: "Social Networks",
              value: ",17,",
              modal_content: nil,
              modal_header: nil,
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "radio",
              order: 17,
              parameter: "environment",
              question: q7)

Answer.create(label: "Yes",
              value: ",18,",
              modal: true,
              modal_content: "The data will be shared publicly on all media in relatin with the contest.",
              modal_header: "Publicly shared",
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "radio",
              order: 18,
              parameter: "shared_data",
              question: q8)

Answer.create(label: "No",
              value: ",19,",
              modal: true,
              modal_content: "The data will be only shared with Ubisoft teams and partners.",
              modal_header: "Not publicly shared",
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "radio",
              order: 19,
              parameter: "shared_data",
              question: q8)

Answer.create(label: "To create in-game content",
              value: ",20,",
              modal_content: nil,
              modal_header: nil,
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "checkbox",
              order: 20,
              parameter: "reused_data",
              question: q9)

Answer.create(label: "To create promotional and marketing content",
              value: ",21,",
              modal_content: nil,
              modal_header: nil,
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "checkbox",
              order: 21,
              parameter: "reused_data",
              question: q9)

Answer.create(label: "To send customer satisfaction survey",
              value: ",22,",
              modal_content: nil,
              modal_header: nil,
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "checkbox",
              order: 22,
              parameter: "reused_data",
              question: q9)

Answer.create(label: "To conduct analytics about user experience",
              value: ",23,",
              modal_content: nil,
              modal_header: nil,
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "checkbox",
              order: 23,
              parameter: "reused_data",
              question: q9)

Answer.create(label: "To send promotional offers",
              value: ",24,",
              modal_content: nil,
              modal_header: nil,
              modal_request_content: nil,
              modal_request_header: nil,
              modal_request_icon: nil,
              answer_type: "checkbox",
              order: 24,
              parameter: "reused_data",
              question: q9)

Answer.create(label: "Other",
              value: ",25,",
              modal_content: nil,
              modal_header: nil,
              modal_request: true,
              modal_request_content: "If the usecases is <br>other<br>, <span class='orange'>please make a request</span>.",
              modal_request_header: "<span class='orange'>It's request time</span>",
              modal_request_icon: "<i class='fas fa-sync-alt white'></i>",
              answer_type: "checkbox",
              order: 25,
              parameter: "reused_data",
              question: q9)

puts "***** New answers created *****"
puts "----- New models created  -----"
