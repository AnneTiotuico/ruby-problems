def rot13(string)
  doubled_alphabet_lower = ('a'..'z').to_a * 2
  doubled_alphabet_upper = ('A'..'Z').to_a * 2
  result = ''
  string.chars do |char|
    if char.match?(/[a-z]/)
      idx = doubled_alphabet_lower.index(char)
      result << doubled_alphabet_lower[idx + 13]
    elsif char.match?(/[A-Z]/)
      idx = doubled_alphabet_upper.index(char)
      result << doubled_alphabet_upper[idx + 13]
    else
      result << char
    end
  end
  result
end


p rot13("Nqn Ybirynpr")
p rot13("Tenpr Ubccre")
p rot13("Nqryr Tbyqfgvar")
p rot13("Nyna Ghevat")
p rot13("Puneyrf Onoontr")
p rot13("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
p rot13("Wbua Ngnanfbss")
p rot13("Ybvf Unvog")
p rot13("Pynhqr Funaaba")
p rot13("Fgrir Wbof")
p rot13("Ovyy Tngrf")
p rot13("Gvz Orearef-Yrr")
p rot13("Fgrir Jbmavnx")
p rot13("Xbaenq Mhfr")
p rot13("Fve Nagbal Ubner")
p rot13("Zneiva Zvafxl")
p rot13("Lhxvuveb Zngfhzbgb")
p rot13("Unllvz Fybavzfxv")
p rot13("Tregehqr Oynapu")