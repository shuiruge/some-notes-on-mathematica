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
		If[dictionaryList === {}(* if it dictionaryList is empty. *),
			dictionaryList = {{notation}, {declaration}};,
			If[MemberQ[dictionaryList[[1]], notation] == True(* if it is already exist. *),
				result = "This notation has already existed, which has been: "<>"\""<>dictionaryList[[2, Position[dictionaryList[[1]], notation][[1,1]]]]<>"\".",
				dictionaryList = {Append[dictionaryList[[1]], notation], Append[dictionaryList[[2]], declaration]};]]]]
