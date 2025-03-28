SMODS.Atlas {
  key = 'jokers',
  px = 69,
  py = 93,
  path = 'jokers.png'
}
--Mouthwashing (Rare)
SMODS.Joker {
  key = "mouthwashing",
  config = {
    extra = {
      xmult = .4,
      totalxmult = 1,
      money = 2,
      totalmoney = 3,
      round = 0
    }
  },
  atlas = 'jokers',
  pos = {x= 0, y= 0},
  rarity = 3,
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  unlocked = true,
  discovered = true,
  calculate = function (self, card, context)
    if(context.joker_main) then
      return {
        xmult = card.ability.extra.totalxmult,
      }
    end
    if(context.end_of_round and context.cardarea == G.jokers) then
      card.ability.extra.totalxmult = card.ability.extra.totalxmult + card.ability.extra.xmult
      card.ability.extra.round = card.ability.extra.round + 1
      if(card.ability.extra.round % 3 == 0) then
        card.ability.extra.totalmoney = card.ability.extra.totalmoney * card.ability.extra.money
      end
      return {
        dollars = -card.ability.extra.totalmoney
      }
    end
  end,
  loc_vars = function (self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.totalxmult,
        card.ability.extra.totalmoney
      }
    }
  end
}
--Super Sonic (Legendary)
SMODS.Joker {
  key = "supersonic",
  config = {
    extra = {
      xmult = .15,
      totalxmult = 1
    }
  },
  atlas = 'jokers',
  pos = {x = 1, y = 0},
  soul_pos = {x = 5, y = 1},
  rarity = 4,
  cost = 20,
  blueprint_compat = true,
  eternal_compat = true,
  unlocked = true,
  discovered = true,
  calculate = function (self, card, context)
    if(context.final_scoring_step) then
      card.ability.extra.totalxmult = card.ability.extra.totalxmult + card.ability.extra.xmult * ((hand_chips - (hand_chips % 50)) / 50 )
      return {
        xmult = card.ability.extra.totalxmult
      }
    end
  end,
  loc_vars = function (self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.totalxmult,
      }
    }
  end 
}
--Sans (Uncommon)
SMODS.Joker {
  key = "sans",
  config = {
    extra = {
      stat1 = 2
    }
  },
  atlas = 'jokers',
  pos = {x = 0, y = 1},
  rarity = 2,
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  unlocked = true,
  discovered = true,
  calculate = function (self, card, context)
    if (context.remove_playing_cards and pseudorandom('sans'..G.GAME.round_resets.ante) < G.GAME.probabilities.normal / card.ability.extra.stat1) then
      if (#G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit) then
      G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
      G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0,
        func = function ()
          local card = create_card("Spectral", G.consumeables, nil, nil, nil, nil, nil, 'sans')
          card:add_to_deck()
          G.consumeables:emplace(card)
          G.GAME.consumeable_buffer = 0
          return true
        end
      }))
      end
      return {
        message = localize('killer'),
        colour = G.C.RED,
        delay = 1.75
      }
    end
  end,
  loc_vars = function (self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.c_judgement
    return {
      vars = {
        G.GAME.probabilities.normal,
        card.ability.extra.stat1
      }
    }
  end
}
--Steve (Common)
SMODS.Joker {
  key = 'minecraft_steve',
  config = {
    extra = {
      mult = 5,
      totalmult = 0,
      durability = 25
    }
  },
  atlas = 'jokers',
  pos = {x = 1, y = 1},
  rarity = 2,
  cost = 5,
  blueprint_compat = true,
  eternal_compat = true,
  unlocked = true,
  discovered = true,
  calculate = function (self, card, context)
    if(context.destroy_card and context.cardarea == G.play and card.ability.extra.durability > 0) then
      if #context.full_hand == 1 and G.GAME.current_round.hands_played == 0 and SMODS.has_enhancement(context.full_hand[1], "m_stone") then
        card.ability.extra.totalmult = card.ability.extra.totalmult + card.ability.extra.mult
        card.ability.extra.durability = card.ability.extra.durability - 1
        return {
          delay = 0.45,
          message = localize('broken'),
          colour = G.C.IMPORTANT,
          remove = true
        }
      end
    end
    if(context.joker_main) then
      return {
        mult = card.ability.extra.totalmult
      }
    end
  end,
  loc_vars = function (self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_stone
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.totalmult,
        card.ability.extra.durability
      }
    }
  end
}
--N (Common)
SMODS.Joker {
  key = "serial_designation_n",
  config = {
    extra = {
      retriggers = 2
    }
  },
  atlas = 'jokers',
  pos = {x = 2, y = 0},
  rarity = 1,
  cost = 5,
  blueprint_compat = true,
  eternal_compat = true,
  unlocked = true,
  discovered = true,
  calculate = function (self, card, context)
    if(context.repetition and context.cardarea == G.play) then
      if(context.other_card == context.scoring_hand[#context.scoring_hand]) then
        return {
          message = localize('fingergun'),
          repetitions = card.ability.extra.retriggers
        }
      end
    end
  end,
  loc_vars = function (self, info_queue, card)
    return {
      vars = {
        card.ability.extra.retriggers
      }
    }
  end
}
--Beat Saber (Uncommon)
SMODS.Joker {
  key = 'beatsaber',
  config = {
    extra = {
      mult = 7,
      chips = 40
    }
  },
  atlas = 'jokers',
  pos = {x = 2, y = 1},
  rarity = 2,
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  unlocked = true,
  discovered = true,
  calculate = function (self, card, context)
    if(context.individual and context.cardarea == G.play) then
      if(context.other_card:is_suit("Clubs") or context.other_card:is_suit("Spades")) then
        return {
          chips = card.ability.extra.chips
        } 
      elseif(context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds")) then
        return {
          mult = card.ability.extra.mult
        }
      elseif(true) then
        return {
          chips = card.ability.extra.chips,
          mult = card.ability.extra.mult
        } 
      end
    end
  end,
  loc_vars = function (self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips,
        card.ability.extra.mult
      }
    }
  end
}
--Blitzo (Rare)
SMODS.Joker {
  key = 'blitzo',
  config = {
    extra = {
      totalchips = 0,
      totalxmult = 1
    }
  },
  atlas = 'jokers',
  pos = {x = 3, y = 0},
  rarity = 3,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  unlocked = true,
  discovered = true,
  calculate = function (self, card, context)
    if(context.joker_main) then
      local contains6 = false
      local contains9 = false
      for index, value in pairs(context.full_hand) do
        if(value:get_id() == 6) then
          contains6 = true
        elseif(value:get_id() == 9) then
          contains9 = true
        end
      end
      if(contains6 and contains9) then
        card.ability.extra.totalxmult = card.ability.extra.totalxmult + .69
      elseif(contains6 or contains9) then
        card.ability.extra.totalchips = card.ability.extra.totalchips + 69
      end
      return {
        xmult = card.ability.extra.totalxmult,
        chips = card.ability.extra.totalchips
      }
    end
  end,
  loc_vars = function (self, info_queue, card)
    return{
      vars = {
        card.ability.extra.totalchips,
        card.ability.extra.totalxmult
      }
    }
  end
}
--Shadow (Rare)
SMODS.Joker {
  key = 'shadow',
  config = {
    extra = {
      xmult = .25,
      decksize = 52,
      totalxmult = 1
    }
  },
  atlas = 'jokers',
  pos = {x = 3, y = 1},
  rarity = 3,
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  unlocked = true,
  discovered = true,
  calculate = function (self, card, context)
    if(context.joker_main) then
      if(G.GAME.starting_deck_size - #G.playing_cards > 0) then
        card.ability.extra.totalxmult = card.ability.extra.xmult*(G.GAME.starting_deck_size - #G.playing_cards) + 1
        card.ability.extra.decksize = G.GAME.starting_deck_size
        return {
          message = localize{type='variable',key='xmult',vars={card.ability.extra.xmult*(G.GAME.starting_deck_size - #G.playing_cards)}},
          xmult_mod = card.ability.extra.xmult*(G.GAME.starting_deck_size - #G.playing_cards) + 1, 
          colour = G.C.MULT
        }
      end
    end
  end,
  loc_vars = function (self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.decksize,
        card.ability.extra.totalxmult,
      }
    }
  end
}
--Uzi (Uncommon)
SMODS.Joker{
  key = 'uzi',
  config = {
    extra = {
      xchips = .9
    }
  },
  atlas = 'jokers',
  pos = {x = 4, y = 1},
  rarity = 2,
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  unlocked = true,
  discovered = true,
  calculate = function (self, card, context)
    if(context.setting_blind and context.blind.boss) then
      G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function ()
          G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.xchips
          G.GAME.blind.chip_text = G.GAME.blind.chips
          return true
        end
      }))
      return {
        message = localize('biteme'),
        delay = .75
      }
    end
  end,
  loc_vars = function (self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xchips
      }
    }
  end
}
--Gojo (Legendary)
SMODS.Joker{
  key = 'gojo',
  config = {
    extra = {
      xmult = .05
    }
  },
  atlas = 'jokers',
  pos = {x = 4, y = 0},
  soul_pos = {x = 5, y = 0},
  rarity = 4,
  cost = 20,
  blueprint_compat = true,
  eternal_compat = true,
  unlocked = true,
  discovered = true,
  calculate = function (self, card, context)
    if(context.individual and context.cardarea == G.play) then
      local rank = context.other_card:get_id()
      local ct = 0
      for key, value in pairs(G.playing_cards) do
        if(value:get_id() == rank) then
          ct = ct + 1
        end
      end
      return {
        xmult = 1 + (ct * card.ability.extra.xmult)
      }
    end
  end,
  loc_vars = function (self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult
      }
    }
  end
}
--Yuji (Rare)
SMODS.Joker{
  key = 'yuji',
  config = {
    extra = {
      mult = 1.25,
      totalmult = 4,
      consumeables = 20,
    }
  },
  atlas = 'jokers',
  pos = {x = 0, y = 2},
  rarity = 3,
  cost = 9,
  blueprint_compat = true,
  eternal_compat = true,
  unlocked = true,
  discovered = true,
  calculate = function (self, card, context)
    if(context.using_consumeable and card.ability.extra.consumeables > 0) then
      card.ability.extra.totalmult = card.ability.extra.totalmult * card.ability.extra.mult
      card.ability.extra.consumeables = card.ability.extra.consumeables - 1
      return {
        message = localize('yujinom'),
        delay = .4,
      }
    end
    if(context.joker_main) then
      return {
        mult = card.ability.extra.totalmult
      }
    end
  end,
  loc_vars = function (self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.totalmult,
        card.ability.extra.consumeables
      }
    }
  end
}
SMODS.Challenge {
  key = "TestOP",
  rules = {
    modifiers = {
      {id = 'hand_size', value = 60}
    }
  },
  jokers = {
    {
      id ='j_fg_minecraft_steve'
    },
    {
      id = 'j_fg_sans'
    },
    {
      id = 'j_fg_mouthwashing'
    },
    {
      id = 'j_fg_supersonic'
    },
    {
      id = 'j_oops'
    },
    {
      id = 'j_fg_serial_designation_n'
    },
    {
      id = 'j_fg_beatsaber'
    },
    {
      id = 'j_fg_blitzo'
    },
    {
      id = 'j_fg_shadow'
    },
    {
      id = 'j_fg_uzi'
    },
    {
      id = 'j_fg_gojo'
    },
    {
      id = 'j_fg_yuji'
    },
    {
      id = 'j_dna'
    },
    {
      id = 'j_marble'
    }
  },
  deck = {
    type = "Challenge Deck"
  },
  unlocked = true
}

SMODS.Challenge {
  key = "Test",
  jokers = {
    {
      id ='j_fg_minecraft_steve'
    },
    {
      id = 'j_fg_sans'
    },
    {
      id = 'j_fg_mouthwashing'
    },
    {
      id = 'j_fg_supersonic'
    },
    {
      id = 'j_fg_serial_designation_n'
    },
    {
      id = 'j_fg_beatsaber'
    },
    {
      id = 'j_fg_blitzo'
    },
    {
      id = 'j_fg_uzi'
    },
    {
      id = 'j_fg_gojo'
    },
    {
      id = 'j_fg_shadow'
    },
    {
      id = 'j_fg_yuji'
    }
  },
  deck = {
    type = "Challenge Deck"
  },
  unlocked = true
}