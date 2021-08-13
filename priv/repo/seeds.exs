# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Birdservice.Repo.insert!(%Birdservice.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Birdservice.Repo
alias Birdservice.Birds.Bird

Repo.insert! %Bird{
    slug: "pandion-haliaetus", 
    name_sv: "Fiskgjuse", 
    name_latin: "Pandion haliaetus", 
    name_en: "Osprey", 
    characteristics: "55–60 cm med ett vingspann på 145–170 cm. Vit undersida med mörka \"knogar\" på vingarna. Översidan mörk och spräcklig. I flykten kupade vingar och nedsänkta \"händer\" vilket gör att den kan se ut som en stor måsfågel.", 
    hunt: "", 
    link: "https://www.fageln.se/art/fiskgjuse.aspx",
    spread: "Hela landet."
}

Repo.insert! %Bird{
    slug: "pernis-apivorus", 
    name_sv: "Bivråk", 
    name_latin: "Pernis apivorus", 
    name_en: "European honey buzzard", 
    characteristics: "46-58 cm med ett vingspann på ca 115-135 cm. Klen näbb. Mörk ovansida och ljus undersida. Tvärbandad på vingar och stjärt. Fjäderdräkten är variabel från mörk till ljus till rödbrun form.",
    hunt: "", 
    link: "https://www.fageln.se/arter/bivrak.aspx", 
    spread: "Hela landet utom fjällen och längst i norr."
}
