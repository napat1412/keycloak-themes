var config = {
  "EN": {
    "questions": [
      {
        "name": "In which European city has the climate contract been signed in 2015?",
        "answers": [
          "Paris",
          "Oslo",
          "Vienna"
        ],
        "correctAnswer": "Paris"
      },
      {
        "name": "Which disruptive innovation is driving cryptocurrencies?",
        "answers": [
          "Bicycle",
          "Vegan food",
          "Blockchain"
        ],
        "correctAnswer": "Blockchain"
      },
      {
        "name": "How are the mountains called in western Europe?",
        "answers": [
          "Alps",
          "Chain",
          "Brownies"
        ],
        "correctAnswer": "Alps"
      },
      {
        "name": "How do we call the area of never melting ice and snow on top of mountains?",
        "answers": [
          "Sugar top",
          "Glacier",
          "Powder"
        ],
        "correctAnswer": "Glacier"
      },
      {
        "name": "Who is current United Nations Secretary General?",
        "answers": [
          "Donald Trump",
          "Kofi Annan",
          "António Guterres"
        ],
        "correctAnswer": "António Guterres"
      },
      {
        "name": "Which of these is a theory about the creation of the universe?",
        "answers": [
          "Big Bong",
          "Big Bang",
          "Big Ben"
        ],
        "correctAnswer": "Big Bang"
      },
      {
        "name": "Who was anti-apartheid activist, peace nobel prize winner and former president of South Africa?",
        "answers": [
          "Mahatma Gandhi",
          "Nelson Mandela",
          "Che Guevara"
        ],
        "correctAnswer": "Nelson Mandela"
      }
    ]
  },
  "DE": {
    "questions": [
      {
        "name": "In welcher europäischen Stadt wurde der Klimavertrag im Jahr 2015 unterzeichnet?",
        "answers": [
          "Paris",
          "Oslo",
          "Wien"
        ],
        "correctAnswer": "Paris"
      },
      {
        "name": "Welche Innovation treibt Kryptowährungen voran?",
        "answers": [
          "Fahrrad",
          "Veganes Essen",
          "Blockchain"
        ],
        "correctAnswer": "Blockchain"
      },
      {
        "name": "Wie heißt das höchste Gebirge in Westeuropa?",
        "answers": [
          "Alpen",
          "Kette",
          "Brownies"
        ],
        "correctAnswer": "Alpen"
      },
      {
        "name": "Wie nennt man den Bereich eines Berges, der das ganze Jahr von Schnee bedeckt ist?",
        "answers": [
          "Sugar top",
          "Gletscher",
          "Puder"
        ],
        "correctAnswer": "Gletscher"
      },
      {
        "name": "Wer ist derzeitiger Generalsekretär der Vereinten Nationen?",
        "answers": [
          "Donald Trump",
          "Kofi Annan",
          "António Guterres"
        ],
        "correctAnswer": "António Guterres"
      },
      {
        "name": "Wie heißt die Theorie über die Erschaffung des Universums?",
        "answers": [
          "Big Bong",
          "Urknall",
          "Big Ben"
        ],
        "correctAnswer": "Urknall"
      },
      {
        "name": "Wer war Anti-Apartheid-Aktivist, Friedensnobelpreisträger und ehemaliger Präsident von Südafrika?",
        "answers": [
          "Mahatma Gandhi",
          "Nelson Mandela",
          "Che Guevara"
        ],
        "correctAnswer": "Nelson Mandela"
      }
    ]
  },
  "ES": {
    "questions": [
      {
        "name": "¿En qué ciudad europea se firmó el acuerdo contra el cambio climático de 2015?",
        "answers": [
          "Paris",
          "Oslo",
          "Viena"
        ],
        "correctAnswer": "Paris"
      },
      {
        "name": "¿En qué disruptiva innovación se basan las criptomonedas?",
        "answers": [
          "Bicicleta",
          "Comida vegana",
          "Blockchain"
        ],
        "correctAnswer": "Blockchain"
      },
      {
        "name": "¿Cómo se llaman las montañas de Europa Occidental?",
        "answers": [
          "Alpes",
          "Cadena",
          "Bizcocho"
        ],
        "correctAnswer": "Alpes"
      },
      {
        "name": "¿Cómo se llama el área de la cumbre de las montañas que está siempre cubierta de hielo y nieve?",
        "answers": [
          "Cobertura de azúcar",
          "Glaciar",
          "Polvo"
        ],
        "correctAnswer": "Glaciar"
      },
      {
        "name": "¿Quién es el actual Secretario General de Naciones Unidas?",
        "answers": [
          "Donald Trump",
          "Kofi Annan",
          "António Guterres"
        ],
        "correctAnswer": "António Guterres"
      },
      {
        "name": "¿Cuál es una teoría sobre la creación del universo?",
        "answers": [
          "Big Bong",
          "Big Bang",
          "Big Ben"
        ],
        "correctAnswer": "Big Bang"
      },
      {
        "name": "¿Quién fue activista contra el apartheid, ganador del premio Nobel de la Paz y ex-presidente de Sudáfrica?",
        "answers": [
          "Mahatma Gandhi",
          "Nelson Mandela",
          "Che Guevara"
        ],
        "correctAnswer": "Nelson Mandela"
      }
    ]
  }
}

var selectedQuestion;

function checkAnswer() {
  const selectionList = document.getElementById('selection');
  const registerButton = document.getElementById('registerSubmit');
  const selected = selectionList.options[selectionList.selectedIndex].value;

  if (selected == selectedQuestion.correctAnswer) {
    registerButton.disabled = false;
    return true;
  } else {
    registerButton.disabled = true;
    this.initialize();
    return false;
  }
}

function initialize() {
  const selectionList = document.getElementById('selection');
  const selectionLabel = document.getElementById('selectionLabel');
  this.initializeQuestions();

  if (selectionList != null && selectionLabel != null) {

    selectionLabel.innerHTML = selectedQuestion.name;

    if(selectionList.options.length > 1) {
      this.removeOptions(selectionList);
    }

    this.createOptions(selectionList);
  }
}

function initializeQuestions() {
  const languagePicker = document.getElementById('language-picker-dropdown');
  const id = Math.floor(Math.random() * 7);

  const selectedLanguage = languagePicker.options[languagePicker.selectedIndex].text;

  switch (selectedLanguage) {
    case 'Deutsch':
      selectedQuestion = config.DE.questions[id];
      break;
    case 'Español':
      selectedQuestion = config.ES.questions[id];
      break;
    default:
      selectedQuestion = config.EN.questions[id];
      break;
  }
}

function removeOptions(selectionList) {
  for(var i = selectionList.options.length; i > 0; i--) {
    selectionList.remove(i);
  }
}

function createOptions(selectionList) {
  for (var i = 0; i < selectedQuestion.answers.length; i++) {
    var option = document.createElement("option");
    option.value = selectedQuestion.answers[i];
    option.text = selectedQuestion.answers[i];

    selectionList.appendChild(option);
  }
}