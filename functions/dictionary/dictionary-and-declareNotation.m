(* ::Package:: *)

(* for the usage, see the example in the notebook file. *)


(* initialize: *)
dictionaryList = {};


dictionary[notation_] :=
Module[{position, result},
	If[Head@notation =!= String,
		result = "Input notation must be a STRING.",
		position = Position[dictionaryList[[1]], notation];
		result = If[position === {},
				"No such a notation.",
				dictionaryList[[2, position[[1,1]]]]]]]

dic = dictionary;


declareNotation[notation_, declaration_] :=
Module[{result},
	If[Head@notation=!=String||Head@declaration=!=String,
		result = "Please use STRING as inputs.",
		If[MemberQ[dictionaryList[[1]], notation] == True,
			result = "This notation has already existed.",
			dictionaryList = {Append[dictionaryList[[1]], notation], Append[dictionaryList[[2]], declaration]};]]]
