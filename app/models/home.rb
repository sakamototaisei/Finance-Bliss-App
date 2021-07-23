class Home < ApplicationRecord

  def self.accumulation(age)
    case age
    when 10 then
      return (30000000 * 0.00283) / 12
    when 11 then
      return (30000000 * 0.00298) / 12
    when 12 then
      return (30000000 * 0.00314) / 12
    when 13 then
      return (30000000 * 0.00330) / 12
    when 14 then
      return (30000000 * 0.00348) / 12
    when 15 then
      return (30000000 * 0.00367) / 12
    when 16 then
      return (30000000 * 0.00386) / 12
    when 17 then
      return (30000000 * 0.00407) / 12
    when 18 then
      return (30000000 * 0.00429) / 12
    when 19 then
      return (30000000 * 0.00453) / 12
    when 20 then
      return (30000000 * 0.00478) / 12
    when 21 then
      return (30000000 * 0.00504) / 12
    when 22 then
      return (30000000 * 0.00532) / 12
    when 23 then
      return (30000000 * 0.00561) / 12
    when 24 then
      return (30000000 * 0.00593) / 12
    when 25 then
      return (30000000 * 0.00626) / 12
    when 26 then
      return (30000000 * 0.00662) / 12
    when 27 then
      return (30000000 * 0.00699) / 12
    when 28 then
      return (30000000 * 0.00739) / 12
    when 29 then
      return (30000000 * 0.00782) / 12
    when 30 then
      return (30000000 * 0.00828) / 12
    when 31 then
      return (30000000 * 0.00876) / 12
    when 32 then
      return (30000000 * 0.00928) / 12
    when 33 then
      return (30000000 * 0.00984) / 12
    when 34 then
      return (30000000 * 0.01043) / 12
    when 35 then
      return (30000000 * 0.01107) / 12
    when 36 then
      return (30000000 * 0.01176) / 12
    when 37 then
      return (30000000 * 0.01249) / 12
    when 38 then
      return (30000000 * 0.01328) / 12
    when 39 then
      return (30000000 * 0.01413) / 12
    when 40 then
      return (30000000 * 0.01505) / 12
    when 41 then
      return (30000000 * 0.01605) / 12
    when 42 then
      return (30000000 * 0.01712) / 12
    when 43 then
      return (30000000 * 0.01829) / 12
    when 44 then
      return (30000000 * 0.01956) / 12
    when 45 then
      return (30000000 * 0.02095) / 12
    when 46 then
      return (30000000 * 0.02247) / 12
    when 47 then
      return (30000000 * 0.02414) / 12
    when 48 then
      return (30000000 * 0.02597) / 12
    when 49 then
      return (30000000 * 0.02800) / 12
    when 50 then
      return (30000000 * 0.03024) / 12
    when 51 then
      return (30000000 * 0.03275) / 12
    when 52 then
      return (30000000 * 0.03555) / 12
    when 53 then
      return (30000000 * 0.03870) / 12
    when 54 then
      return (30000000 * 0.04227) / 12
    when 55 then
      return (30000000 * 0.04634) / 12
    when 56 then
      return (30000000 * 0.05102) / 12
    when 57 then
      return (30000000 * 0.05646) / 12
    when 58 then
      return (30000000 * 0.06283) / 12
    when 59 then
      return (30000000 * 0.07039) / 12
    when 60 then
      return (30000000 * 0.07950) / 12
    when 61 then
      return (30000000 * 0.09069) / 12
    when 62 then
      return (30000000 * 0.10472) / 12
    when 63 then
      return (30000000 * 0.12282) / 12
    when 64 then
      return (30000000 * 0.14702) / 12
    when 65 then
      return (30000000 * 0.18097) / 12
    when 66 then
      return (30000000 * 0.23201) / 12
    when 67 then
      return (30000000 * 0.31721) / 12
    when 68 then
      return (30000000 * 0.48780) / 12
    when 69 then
      return (30000000 * 1) / 12
    else
      return 0
    end
  end

  # result = accumulation(24)

  # puts result

end