require 'httparty'
def pof(text)
  if text == "PASSED"
    "[ \e[32mPASSED!\e[0m ] "
  else
    "[ \e[31mFAILED!\e[0m ] "
  end
end

class RESTtester
  def self.test_1
    print "Testing reading of all contacts..."
    req = HTTParty.get('http://localhost:4567/contacts')
    all_result = req.body == "all contacts" ? "PASSED" : "FAILED"
    puts pof(all_result)
    
    print "Testing reading of single contact..."
    req = HTTParty.get('http://localhost:4567/contacts/99')
    show_result = req.body == "view an existing contact" ? "PASSED" : "FAILED"
    puts pof(show_result)
    
    print "Testing creation of single contact..."
    req = HTTParty.post('http://localhost:4567/contacts')
    create_result = req.body == "create new contact" ? "PASSED" : "FAILED"
    puts pof(create_result)
    
    print "Testing update of single contact..."
    req = HTTParty.put('http://localhost:4567/contacts/7')
    update_result = req.body == "update an existing contact" ? "PASSED" : "FAILED"
    puts pof(update_result)
    
    print "Testing delete of single contact..."
    req = HTTParty.delete('http://localhost:4567/contacts/99')
    delete_result = req.body == "delete an existing contact" ? "PASSED" : "FAILED"
    puts pof(delete_result)
  end
end

RESTtester.test_1