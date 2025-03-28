return {
  descriptions = {
    Joker = {
      j_fg_mouthwashing = {
        name = 'Mouthwashing',
        text = {
          'Gains {X:mult,C:white}X#1#{} Mult per round',
          'Double money lost every 3 rounds',
          '{C:inactive}Currently {X:mult,C:white}X#2#{C:inactive} Mult and {C:money}-$#3#',
          '{s:.75,C:inactive}Is it worth the relief?'
        }
      },
      j_fg_supersonic = {
        name = "Super Sonic",
        text = {
          "Gains {X:mult,C:white}X#1#{} Mult",
          "per{C:chips} 50 {}Chips in played hand",
          "{C:inactive}Currently {X:mult,C:white}X#2#{C:inactive} Mult"
        }
      },
      j_fg_sans = {
        name = "Sans",
        text = {
          '{C:green}#1# in #2# {}chance to create a {C:spectral}Spectral',
          'card when any playing card is destroyed',
          '{C:inactive}(Must have room)',
          '{C:red,s:.75}Wanna have a bad time?'
        }
      },
      j_fg_minecraft_steve = {
        name = "Steve",
        text = {
          "If {C:attention}first hand {}in round is a {C:attention}Stone card,",
          "destroy it and gain {C:mult}+#1# {}Mult",
          "Watch out for your {C:attention}Durability!",
          "{C:inactive}Currently {C:mult}+#2# {C:inactive}Mult and {C:attention}#3# {C:inactive}Durability",
          "{C:inactive,s:.75}I AM STEVE"
        }
      },
      j_fg_serial_designation_n = {
        name = "Serial Desgination N",
        text = {
          "Retrigger {C:attention}last{} played",
          "card used in scoring",
          "{C:attention}#1#{} additional times",
          "{C:inactive}*Finger guns*"
        }
      },
      j_fg_beatsaber = {
        name = "Saber Wielder",
        text = {
          "Played cards with {C:clubs}Clubs{} or {C:spades}Spades{} suit",
          "give {C:chips}+#1# {}Chips and {C:hearts}Hearts{} or {C:diamonds}Diamonds{}",
          "suit give {C:mult}+#2# {}Mult when scored"
        }
      },
      j_fg_blitzo = {
        name = 'Blitzo',
        text = {
          'If played hand contains a 6 {C:attention}or{} a 9,',
          'this card gains {C:chips}+69 {}Chips',
          'If played hand contains a 6 {C:attention}and{} a 9,',
          'this card gains {X:mult,C:white}X.69{} Mult',
          '{C:inactive}Currently {C:chips}+#1# {C:inactive}Chips and {X:mult,C:white}X#2#{C:inactive} Mult',
          '{C:inactive}~~~Stolas~~~'
        }
      },
      j_fg_shadow = {
        name = "Shadow",
        text = {
          '{X:mult,C:white}X#1#{} Mult for each card',
          'below {C:attention}#2#{} in your full deck',
          '{C:inactive}Currently {X:mult,C:white}X#3#{} Mult'
        }
      },
      j_fg_uzi = {
        name = 'Uzi',
        text = {
          'Multiplies the boss blind requirement',
          'by {X:chips,C:white}X#1#{} Chips'
        }
      },
      j_fg_gojo = {
        name = "Saturo Gojo",
        text = {
          "When a card is scored, gain {X:mult,C:white}X#1#{} Mult",
          "for each of that {C:attention}rank{} in {C:attention}full deck"
        }
      },
      j_fg_yuji = {
        name = 'Yuji Itadori',
        text = {
          "The next #3# {C:attention}comsumables{} ",
          "used multiplies Mult on this",
          "card by {C:attention}#1#X",
          "{C:inactive}Currently {C:mult}+#2#{C:inactive} Mult"
        }
      }
    }
  },
  misc = {
    challenge_names = {
      c_fg_TestOP = "Test OP",
      c_fg_Test = "Test"
    },
    dictionary = {
      broken = "BREAK",
      killer = "DIRTY BROTHER KILLER",
      fingergun = "*Finger gun*",
      biteme = "Bite me!",
      yujinom = "*Crunch*"
    },
    v_dictionary = {
      mult = "+#1# Mult",
      minusmult = "-#1# Mult",
      xmult = "+X#1# Mult",
      minusxmult = "-X#1# Mult",
      chips = "+#1# Chips",
      minuschips = "-#1# Chips",
      money = "$#1#",
      minusmoney = "-$#1#",
    }
  }
}