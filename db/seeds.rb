
# Initialization
[Question, Answer].each do |model_name|
  model_name.destroy_all
end
puts "***** Destroy all models    *****"
puts "----- Wait while processing -----"

# Questions
q1 = Question.create(title: "What do you want to organize ?", position: 1)
q2 = Question.create(title: "Who is the organizer ?", position: 2)
q3 = Question.create(title: "Is the agency under contract with Ubisoft", position: 3) # If Answer.order == 4
q4 = Question.create(title: "Choose the agency", position: 4) # If Answer.order == 4 && Answer.order == 5
q5 = Question.create(title: "How personal data are collected ?", position: 5)
q6 = Question.create(title: "Which data will be collected and processed ?", position: 6) # If Answer.order == 11 || Answer.order == 12
q7 = Question.create(title: "On which environment is the contest organized ?", position: 7)
q8 = Question.create(title: "Is the data shared publicly", position: 8)
q9 = Question.create(title: "For what purpose(s) will the data be reused", position: 9, hint: "Please check only the usecases for which you will reuse the data collected about the entrants",
                    hint_icon: "<i class='fas fa-exclamation-triangle white'></i>")

puts "***** New questions created *****"

# Answers
Answer.create(label: "A contest", value: ",du jeu concours,", hint: nil, hint_header: nil, answer_type: "radio", order: 1, question: q1)
Answer.create(label: "An event", value: ",de l'évènement,", hint: nil, hint_header: nil, answer_type: "radio", order: 2, question: q1)

Answer.create(label: "Ubisoft", value: ",collecte et traite vos données personnelles,", hint: nil, hint_header: nil,
              answer_type: "radio", order: 3, question: q2)
Answer.create(label: "An external agency", value: nil, hint: nil, hint_header: nil, answer_type: "radio", order: 4, question: q2)

Answer.create(label: "Yes", hint: "If the contest is organized by an external agency, <span class='orange'>please make a request</span>.",
              hint_header: "<span class='orange'>It's request time</span>", hint_icon: "<i class='fas fa-sync-alt white'></i>",
              answer_type: "radio", order: 5, question: q3)
Answer.create(label: "No", hint: "If the contest is organized by an external agency which is not under contract with Ubisoft, <span class='orange'>please make a request</span>.",
              hint_header: "<span class='orange'>It's request time</span>", hint_icon: "<i class='fas fa-sync-alt white'></i>",
              answer_type: "radio", order: 6, question: q3)

Answer.create(label: "Agency 1", value: ",a chargé la société 'Agency 1' de collecter et traiter vos données personnelles,",
              hint: nil, hint_header: nil, answer_type: "select", order: 7, question: q4)
Answer.create(label: "Agency 2", value: ",a chargé la société 'Agency 2' de collecter et traiter vos données personnelles,",
              hint: nil, hint_header: nil, answer_type: "select", order: 8, question: q4)
Answer.create(label: "Other", hint: nil, hint_header: nil, answer_type: "select", order: 9, question: q4)

Answer.create(label: "Directly", value: ",contacter les gagnants afin de remettre les prix,et partager le contenu que vous publirez,",
              hint: "Ubisoft uses data that entered directly via a form.", hint_header: "Directly",
              answer_type: "radio", order: 10, question: q5)
Answer.create(label: "Indirectly", hint: "Ubisoft uses data that already exist in its data bases. (eg : in game data)",
              hint_header: "Indirectly", answer_type: "radio", order: 11, question: q5)
Answer.create(label: "Both", hint: nil, hint_header: nil,answer_type: "radio", order: 12, question: q5)

Answer.create(label: nil, hint: "Tag the collected and processed data below and PRESS ENTER", hint_header: nil,
              answer_type: "text", order: 13, question: q6)

Answer.create(label: "Ubisoft environment", value: ",les utilisateurs des supports sur lesquels vous publirez votre contenu dans le cadre du jeu concours,jusqu'à ce que vous supprimiez le contenu que vous avez partagé,",
              hint: "The Ubisoft environment includes all Ubisoft websites.", hint_header: "Ubisoft environment",
              answer_type: "radio", order: 14, question: q7)
Answer.create(label: "In-game", value: ",les utilisateurs du jeu sur lequel votre contenu a été publié,", hint: nil,
              hint_header: nil, answer_type: "radio", order: 15, question: q7)
Answer.create(label: "Third party environment", value: ",les utilisateurs des supports sur lesquels vous publirez votre contenu dans le cadre du jeu concours,jusqu'à ce que vous supprimiez le contenu que vous avez partagé,",
              hint: "When the is organized on external partner's platform.", hint_header: "Third party environment",
              answer_type: "radio", order: 16, question: q7)
Answer.create(label: "Social Networks", value: ",les utilisateurs des supports sur lesquels vous publirez votre contenu dans le cadre du jeu concours,jusqu'à ce que vous supprimiez le contenu que vous avez partagé,",
              hint: nil, hint_header: nil, answer_type: "radio", order: 17, question: q7)

Answer.create(label: "Yes", hint: "The data will be shared publicly on all media in relatin with the contest.",
              hint_header: "Publicly shared", answer_type: "radio", order: 18, question: q8)
Answer.create(label: "No", hint: "The data will be only shared with Ubisoft teams and partners.",
              hint_header: "Not publicly shared", answer_type: "radio", order: 19, question: q8)

# Get the value from the form
Answer.create(label: "To create in-game content", hint: nil, hint_header: nil, answer_type: "checkbox", order: 18, question: q9)
Answer.create(label: "To create promotional and marketing content", value: ",utilisées à des fins promotionnelles ou marketing,par les destinataires des messages promotionnels ou marketing intégrant votre contenu,",
              hint: nil, hint_header: nil, answer_type: "checkbox", order: 19, question: q9)
Answer.create(label: "To send customer satisfaction survey", value: ",vous envoyer des enquêtes de satisfaction,vous envoie des enquêtes de satisfaction,",
              hint: nil, hint_header: nil, answer_type: "checkbox", order: 20, question: q9)
Answer.create(label: "To conduct analytics avout user experience", value: ",tant que vous consentez à ce qu'Ubisoft réalise des statistiques,",
              hint: nil, hint_header: nil, answer_type: "checkbox", order: 21, question: q9)
Answer.create(label: "To send promotional offers", value: ",vous envoie des offres promotionnelles,",
              hint: nil, hint_header: nil, answer_type: "checkbox", order: 22, question: q9)
Answer.create(label: "Other", hint: "If the usecases is <br>other<br>, <span class='orange'>please make a request</span>.",
              hint_header: "<span class='orange'>It's request time</span>", hint_icon: "<i class='fas fa-sync-alt white'></i>",
              answer_type: "checkbox", order: 23, question: q9)

puts "***** New answers created *****"
puts "----- New models created  -----"
