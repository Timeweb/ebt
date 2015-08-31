-module(ebt_date).

-export([date_str/1]).
-export([date_str_ru/0]).
-export([date_str_de/0]).

date_str("ru") ->
  date_str_ru();
date_str("de") ->
  date_str_de().

date_str_ru() ->
    Months = #{
        1 => " января ",
        2 => " февраля ",
        3 => " марта ",
        4 => " апреля ",
        5 => " мая ",
        6 => " июня ",
        7 => " июля ",
        8 => " августа ",
        9 => " сентября ",
        10 => " октября ",
        11 => " ноября ",
        12 => " декабря "
       },
    YearStr = " года",
    {{Y, M, D}, _} = erlang:localtime(),
    unicode:characters_to_binary(integer_to_list(D) ++ maps:get(M, Months) ++ integer_to_list(Y) ++ YearStr).

date_str_de() ->
  Months = #{
        1 => " Januar ",
        2 => " Februar ",
        3 => " März ",
        4 => " April ",
        5 => " Mai ",
        6 => " Juni ",
        7 => " Juli ",
        8 => " August ",
        9 => " September ",
        10 => " Oktober ",
        11 => " November ",
        12 => " Dezember "
      },
  YearStr = "",
  {{Y, M, D}, _} = erlang:localtime(),
  unicode:characters_to_binary(integer_to_list(D) ++ maps:get(M, Months) ++ integer_to_list(Y) ++ YearStr).
