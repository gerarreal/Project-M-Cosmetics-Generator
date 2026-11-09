<h1>Project M Cosmetics Generator</h1>

Generates Character Selection Screen and Stage Selection Screen cosmetic names for Super Smash Bros. Brawl in the style of the original game, as well as in the style of Project M and it's successor, Project+.
Saved cosmetics are saved in this <a href="https://www.love2d.org/wiki/love.filesystem">directory</a>, which will depend on your filesysten
  

<h1>How to use</h1>
By booting up for the first time, the program will create the necessary folders for the cosmetics and a few .txt template files containing the name of each playable fighter and stage in Project+Ex. Cosmetics are ordered per .txt listing and are ordered like this:

<ul>
  <il>vBrawl elements, with a few exceptions:</il>
  <ul>
    <il>For characters, special names like Zero Suit Samus or King Dedede's name change in PM are ordered after vanilla but before PM.</il><br>
    <il>For stages, Melee Yoshi's Island is by default named Dinosaur Land.</il>
  </ul>
  <il>Project M</il><br>
  <il>Project+</il><br>
  <il>Project+Ex (up until Zero/1.8)</il><br>
</ul>

By default, there are two files, char_list.txt and stage_list.txt.

For characters, there are two extra .txt files specifically for character select icon names and Brawl battle names.
<h2>char_cssi_name.txt</h2>
This file is intended for character selection screen names and it's intended to be written in capital letters.
<h2>char_batl_name.txt</h2>
This file is intended for damage meter names. It is formatted as <i>name</i>|<i>number</i>. The name is for the character's name and the number is for the width the damage meter name shall take.
  
The program will override existing cosmetics without additional input.

There are four styles the program will generate: Brawl, PM/+, REX and "Special". Below is a table with the current capabilities of each.

<table>
  <tr>
    <th></th>
    <th>Brawl</th>
    <th>Project M/Project+</th>
    <th>REX</th>
    <th>"Special"</th>
  </tr>
  <tr>
    <th>Battle</th>
    <td>x</td>
    <td> </td>
    <td> </td>
    <td> </td>
  </tr>
  <tr>
    <th>Character Select</th>
    <td>x</td>
    <td>x</td>
    <td>x</td>
    <td>x</td>
  </tr>
  <tr>
    <th>Stage Select</th>
    <td>x</td>
    <td>x</td>
    <td>x</td>
    <td>x</td>
  </tr>
</table>
  
Due to how the .txt file is structured, you can add more names in the list to generate character cosmetics.
  
<h1>Building</h1>
As of 4.0, the final source code is available and the program can be built with an installation of the latest version of Love2D. To do so, follow the instructions on <a href="https://www.love2d.org/wiki/Game_Distribution">the official wiki's distribution page</a>.

Nab <a href="kingjigglypuff.github.io">Project+Ex</a> from here.
