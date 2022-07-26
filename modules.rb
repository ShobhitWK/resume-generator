module ResumeGeneration
    class ResumeGenerator
        def initialize
            @resume_values = Hash.new
            inputs = get_user_inputs()
            create_resume_file
        end

        def get_user_inputs

            name_validated = true
            while name_validated
                system('clear')

                print "Enter your Name: "
                val = gets.chomp.to_s
                if !val.nil? && !val.empty?  # if in input is not given it will not add the query in resume
                    @resume_values["Name"]=val.capitalize()
                    name_validated = false
                else
                    puts "Enter your name to proceed!!!"
                end
                system('clear')

            end

            inputList = [
                "Father Name",
                "Gender [M/F]",
                "Address",
                "Languages",
                "School name",
                "Secondary class %",
                "Senior secondary class %",
                "College name",
                "College aggregate score",
                "Hobbies",
                "Strengths",
            ]

            system('clear')

            for index in inputList
                print "Enter your #{index}: "
                val = gets.chomp.to_s
                if !val.nil? && !val.empty?  # if input is not given it will not add the query in resume
                    @resume_values[index]=val.capitalize()
                end
                system('clear')
            end

            email_validated = true
            dob_validated = true
            phone_validated = true

            while email_validated
                system('clear')
                print "Enter your Mail ID: "
                email = gets.chomp.to_s
                if email =~ EMAIL_REGEX                              # /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
                    @resume_values["Mail ID"] = email
                    email_validated = false
                else
                    puts "Invalid email entered!"
                end
                sleep(1)

            end

            while dob_validated
                system('clear')

                print "Enter your date of birth in (yyyy-mm-dd): "
                dob = gets.chomp.to_s
                if dob =~ DOB_REGEX                                  # /\d{4}-(0[1-9]|1[0-2])-/
                    @resume_values["Date of Birth"] = dob
                    dob_validated = false
                else
                    puts "Invalid DOB entered use correct format"
                end
                sleep(1)
            end

            while phone_validated
                system('clear')

                print "Enter your contact no. in 9999999999 format: "
                phone = gets.chomp.to_s
                if phone =~ PHONE_NUMBER_REGEX                        # /^\(?[\d]{3}\)?[\s|-]?[\d]{3}-?[\d]{4}$/
                    @resume_values["Contact No."] = phone
                    phone_validated = false
                else
                    puts "Invalid contact no. entered use correct format"
                end
                sleep(1)
            end

            return @resume_values
        end

        def create_resume_file

            no = rand(0..99999) # to prevent from same file name error

            unless File.exists?("Generated_resumes/#{@resume_values["Name"]}_#{no}.txt")
                @file = File.new("Generated_resumes/#{@resume_values["Name"]}_#{no}.txt","w")

                # Adding resume details to the file

                @file.puts("===========================================Resume=====================================")

                @resume_values.each { |index,entries|

                    str_len = "| #{index}: #{entries}".length                           # for string length
                    spaces = 85 - str_len                                               # counting how much space needed
                    generated_string = "| #{index}: #{entries}" + " "*spaces + "|"      # generating new string with spaces

                    @file.puts(generated_string)
                }

                @file.puts("======================================================================================")
                puts "======================================================================================"
                system('clear')
                puts "Sucessfully created resume file with name \"#{@resume_values["Name"]}_#{no}.txt\" in Generated_resumes folder."

            else
                puts "Sorry, File with same name already exists please try again!"

            end
        end
    end
end
