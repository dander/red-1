Red [
	description: {Tests for "Reverse String" Exercism exercise}
	author: "loziniak"
]

exercise-slug: "reverse-string"
ignore-after: 1

comment [
	source:
		https://raw.githubusercontent.com/exercism/problem-specifications/main/exercises/reverse-string/canonical-data.json

	{
	  "exercise": "reverse-string",
	  "comments": [
	        "If property based testing tools are available, a good property to test is reversing a string twice: reverse(reverse(string)) == string"
	      ],
	  "cases": [
	    {
	      "uuid": "c3b7d806-dced-49ee-8543-933fd1719b1c",
	      "description": "an empty string",
	      "property": "reverse",
	      "input": {
	        "value": ""
	      },
	      "expected": ""
	    },
	    {
	      "uuid": "01ebf55b-bebb-414e-9dec-06f7bb0bee3c",
	      "description": "a word",
	      "property": "reverse",
	      "input": {
	        "value": "robot"
	      },
	      "expected": "tobor"
	    },
	    {
	      "uuid": "0f7c07e4-efd1-4aaa-a07a-90b49ce0b746",
	      "description": "a capitalized word",
	      "property": "reverse",
	      "input": {
	        "value": "Ramen"
	      },
	      "expected": "nemaR"
	    },
	    {
	      "uuid": "71854b9c-f200-4469-9f5c-1e8e5eff5614",
	      "description": "a sentence with punctuation",
	      "property": "reverse",
	      "input": {
	        "value": "I'm hungry!"
	      },
	      "expected": "!yrgnuh m'I"
	    },
	    {
	      "uuid": "1f8ed2f3-56f3-459b-8f3e-6d8d654a1f6c",
	      "description": "a palindrome",
	      "property": "reverse",
	      "input": {
	        "value": "racecar"
	      },
	      "expected": "racecar"
	    },
	    {
	      "uuid": "b9e7dec1-c6df-40bd-9fa3-cd7ded010c4c",
	      "description": "an even-sized word",
	      "property": "reverse",
	      "input": {
	        "value": "drawer"
	      },
	      "expected": "reward"
	    }
	  ]
	}
]

canonical-cases: [
	#(
		description: "an empty string"
		input: #(value: "")
		expected: ""
	)
	#(
		description: "a word"
		input: #(value: "robot")
		expected: "tobor"
	)
	#(
		description: "a capitalized word"
		input: #(value: "Ramen")
		expected: "nemaR"
	)
	#(
		description: "a sentence with punctuation"
		input: #(value: "I'm hungry!")
		expected: "!yrgnuh m'I"
	)
	#(
		description: "a palindrome"
		input: #(value: "racecar")
		expected: "racecar"
	)
	#(
		description: "an even-sized word"
		input: #(value: "drawer")
		expected: "reward"
	)
]


print ["Testing" ignore-after "cases…"]

cases: copy/deep/part canonical-cases ignore-after
foreach test-case cases [
	result: do
		to file! rejoin [exercise-slug %.red]

	if function? :result [			;-- execute function
		result: do
			append
				copy [result]
				values-of test-case/input
	]

	print [
		pad/with test-case/description 30 #"."
		either result = test-case/expected [
			"✓"
		] [
			rejoin [{FAILED. Expected: "} test-case/expected {", but got "} result {"}]
		]
	]
]

print [
	(length? canonical-cases) - ignore-after
	"cases ignored."
]
