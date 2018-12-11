% part 1 in erlang

-module(part1).
-export([start/0]).

start() ->
    {ok, RawInput} = file:read_file("output_final"),
%   Data = string:trim(unicode:characters_to_list(RawInput)),
    Data = unicode:characters_to_list(RawInput),
    
    
%   {Removed, ParsedData} = process(Data),
    ParsedData1 = loop(Data),
    ParsedData2 = [string:slice(ParsedData1, 0, 1) | loop(string:slice(ParsedData1, 1))],
%   ParsedData2 = loop(string:slice(ParsedData, 1)),
    io:format("~s", [ParsedData2]).

loop(Data) ->
%   {Removed, Processed} = process(Data),
    {Removed1, Processed1} = process(string:slice(Data, 1)),
    {Removed2, Processed2} = process([string:slice(Data, 0, 1) | Processed1]),
%   io:format("loop completed~n~s~n", [Processed2]),
    if
%       Removed -> loop(Processed);
        Removed1 or Removed2 -> loop(Processed2);
        true -> Processed2
    end.

compare(Str) ->
%   io:format("~ngot to compare!~n"),
%   io:format("Str:~s~n", [Str]),
    A = string:slice(Str, 0, 1),
    A_lower = string:to_lower(A),
    B = string:slice(Str, 1, 1),
    B_lower = string:to_lower(B),
%   io:format("A:~s~n", [A]),
%   io:format("B:~s~n", [B]),
    if
        (A /= B) and (A_lower == B_lower)  ->
%           io:format("Removed ~s~s~n", [A,B]),
            {true, ""};
        true ->
            {false, [A|B]}
    end.

process(Data) ->
%   io:format("Processing string ~s", [Data]),
    case string:length(Data) of 
        0 -> 
%           io:format("~ngot to case 0!~n"),
            {false, []};
        1 -> 
%           io:format("~ngot to case 1!~n"),
            {false, Data};
        2 -> 
%           io:format("~ngot to case 2!~n"),
            compare(string:slice(Data, 0, 2));
        _ -> 
%           io:format("~ngot to case 3!~n"),
            {Replaced_A, A} = compare(string:slice(Data, 0, 2)),
            {Replaced_B, B} = process(string:slice(Data, 2)),
            {(Replaced_A or Replaced_B), [A|B]}
    end.
