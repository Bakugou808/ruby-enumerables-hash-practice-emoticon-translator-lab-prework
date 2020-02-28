# require modules here
require "yaml"

def load_library(file)
  yaml_hash = YAML.load_file(file)
  emoticon_hash = {"get_meaning": {}, "get_emoticon": {}}
  
  yaml_hash.map {|meaning, symbol_array|
    emoticon_hash[:get_meaning][symbol_array[-1]] = meaning 
    emoticon_hash[:get_emoticon][symbol_array[0]] = symbol_array[-1]
  }
  emoticon_hash
end

def get_japanese_emoticon(yaml_file, emoticon)
  emoticon_hash = load_library(yaml_file)
<<<<<<< HEAD
  
  emoticon_hash[:get_emoticon].map {|eng_emoti, jap_emoti|
    if emoticon == eng_emoti
      return jap_emoti 
    end 
  }
  
  "Sorry, that emoticon was not found"
=======
  apology_msg = "Apologies, that emoticon is not known."
  
  if emoticon_hash[:get_emoticon].has_key?(emoticon)
    emoticon_hash[:get_emoticon].map {|eng_emoti, jap_emoti|
      if emoticon == eng_emoti
        return jap_emoti 
      end 
    }
  else 
    return apology_msg
  end 
>>>>>>> e327c5bb2a5711e84b35a1407f48ab9080fd1626
end

def get_english_meaning(yaml_file, emoticon)
  emoticon_hash = load_library(yaml_file)
  
  emoticon_hash[:get_meaning].map {|eng_emoti, meaning|
    if eng_emoti == emoticon 
      return meaning 
    end 
  }
  "Sorry, that emoticon was not found"
end