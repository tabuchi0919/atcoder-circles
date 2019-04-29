circle = Circle.find_or_initialize_by(circle_name: 'UtCoder')
circle.password ||= 'hogehoge'
circle.save

[
  "AkkyOrz",
  "Alice_Claire",
  "Alnus",
  "Alt3",
  "Aslan168",
  "B_B_QUEENS",
  "Bison",
  "Dakuon",
  "Fugitsune",
  "Fulltea",
  "Hewla",
  "Hibagon",
  "IdealLife3",
  "J_J_Nisinn",
  "Jokerrr",
  "Kanaya",
  "Kotaro7750",
  "Kotatsun",
  "Lily0727K",
  "MMNMM",
  "Misteer",
  "Mojumbo",
  "Motsu_xe",
  "NMLibrary",
  "Powerword",
  "Ricky_Ban",
  "Ricky_pon",
  "Risebbit",
  "Ruloch",
  "Salmonize",
  "Sekken168",
  "Shibungi",
  "Styla912",
  "Suunn",
  "TumoiYorozu",
  "Udomomo",
  "WooCie",
  "Yamochi",
  "aaabbbcccddd",
  "akouryy",
  "amyu",
  "anagohirame",
  "ants",
  "aralsea",
  "arukuhito",
  "asaka",
  "azaika2098",
  "azara4",
  "benzenehat",
  "betit0919",
  "cakkby",
  "charhan",
  "cheeseNA",
  "cookies",
  "croonalullaby",
  "cuthbert",
  "diohabara",
  "dogumusasi",
  "doradorasuki",
  "drken",
  "easy",
  "enjapma",
  "fancy_lettuce",
  "fiord",
  "fukki",
  "fumiphys",
  "fuppy0716",
  "fushigu",
  "gott",
  "guriko",
  "hahho",
  "hiramekun",
  "hoget157",
  "holeguma",
  "howahowa",
  "hsjoihs",
  "hyper1FU",
  "idsigma",
  "iet461",
  "itohdak",
  "iwannatto",
  "jell",
  "jjjjjjjtgpptmjj",
  "jucky54",
  "juppy",
  "kabuto6419",
  "kammer0820",
  "keikun2000",
  "kkiriyama",
  "kn1cht",
  "knshnb",
  "kort0n",
  "kyomu",
  "leafmoon",
  "linare",
  "macaroni",
  "makonagix",
  "masayoshi64",
  "mathda1",
  "mayota0906",
  "mdj982",
  "melon_ms_mtcc",
  "milky1210",
  "mizukurage",
  "moratorium08",
  "moriiforfun",
  "mqcmd196",
  "ms440",
  "n4o847",
  "ngtkana",
  "nicolen",
  "noimi",
  "nt1010",
  "ogingin",
  "ohen_ac",
  "okumura",
  "omi",
  "omochana2",
  "pachicobue",
  "penerte",
  "platypus",
  "pontadao",
  "progrunner",
  "proton_1602",
  "psmf1",
  "ptt_kr",
  "pyonsu",
  "rausumaru",
  "red0000",
  "redchimps",
  "rikein12",
  "risujiroh",
  "ryosuke07117",
  "saikoumi",
  "satsumaimo",
  "selpo",
  "settyan117",
  "sh_mug",
  "shar18",
  "shimon24",
  "shizukacode",
  "shugo256",
  "snaka0213",
  "snneko",
  "sugarrr",
  "sutoku0718",
  "sykwer",
  "szkieletor",
  "tabr",
  "takashi_o",
  "takuzou_kubifur",
  "tantakatanmen",
  "tesiyosi",
  "tkygtr6",
  "tmsausa",
  "to12lz",
  "tomboftime",
  "tomo0608",
  "torisasami",
  "tspcx",
  "tsubuanko",
  "upura",
  "uron5101",
  "veqcc",
  "verdy89",
  "waffoo",
  "warlus",
  "wisteria0410ss",
  "wolframotoya",
  "y_clps",
  "yapoo",
  "yatuba",
  "ykst51",
  "yosss",
  "yousolo",
  "yuji9511",
  "yumarimo",
  "yyama"
].each do |user_name|
  circle.circle_users.build(
    user_id: User.find_by(user_name: user_name)&.id
  ).save
end

{
  'UtCoder Virtual Contest #1(2000~)' => 'https://not-522.appspot.com/contest/4886244148379648',
  'UtCoder Virtual Contest #1(1600~1999)' => 'https://not-522.appspot.com/contest/4709928140800000',
  'UtCoder Virtual Contest #1(1200~1599)' => 'https://not-522.appspot.com/contest/6433587771473920',
  'UtCoder Virtual Contest #1(~1199)' => 'https://not-522.appspot.com/contest/4708497648254976',
  'UtCoder Virtual Contest #2(2000~)' => 'https://not-522.appspot.com/contest/5635153418256384',
  'UtCoder Virtual Contest #2(1600~1999)' => 'https://not-522.appspot.com/contest/5657593833848832',
  'UtCoder Virtual Contest #2(1200~1599)' => 'https://not-522.appspot.com/contest/5118861103857664',
  'UtCoder Virtual Contest #2(~1199)' => 'https://not-522.appspot.com/contest/5728361875767296'
}.each do |key, value|
  circle.virtual_contests.build(
    title: key, url: value
  ).save
end
