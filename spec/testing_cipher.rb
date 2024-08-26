require './lib/cipher_class'

describe Cipher do
    
    subject(:class_test){Cipher.new('What a string!',5)}

    describe "#get_ascii" do
        
        context 'get ascii code from a letter' do
            
            before do
                @first_test='a'
                @second_test='?'
            end

            it 'should return 97' do
                
                solution=class_test.get_ascii(@first_test)

                expect(solution).to eq(97)
            end

            it 'should return 63' do

                solution=class_test.get_ascii(@second_test)

                expect(solution).to eq(63)
            end
        end

    end

    describe "#turn_ascii_to_letter" do

        context 'transform an ascii number into a symbol' do
            before do
                @first_test=122
                @second_test=64
            end

            it 'should return z' do
                solution=class_test.turn_ascii_to_letter(@first_test)

                expect(solution).to eq('z')
            end

            it 'should return @' do
                solution=class_test.turn_ascii_to_letter(@second_test)

                expect(solution).to eq('@')
            end
        end

    end

    describe "#shift_letter" do

        context 'shift the ascii code of a certain letter' do
            before do
                @letter1='a'
                @number1=5
                @letter2='('
                @number2=2
            end

            let(:shiftty){class_test.shift_letter(@letter1,@number1)}
            let(:shifty2){class_test.shift_letter(@letter2,@number2)}

            it 'should return f' do
                solution=class_test.turn_ascii_to_letter(shiftty)
                expect(solution).to eq('f')
            end

            it 'should return *' do
                solution=class_test.turn_ascii_to_letter(shifty2)
                expect(solution).to eq('*')
            end
        end

        describe "#cipher_the_word" do
            context 'cipher a small letter word' do
                
                before do
                    @word1='banana'
                    @number1=3

                    @w2='we like butter!'
                    @n2=5
                end

                subject(:new_test){Cipher.new(@word1,@number1)}
                let(:tesing_value){new_test.cipher_the_word}

                subject(:new_test2){described_class.new(@w2,@n2)}
                let(:testing_second_value){new_test2.cipher_the_word}

                it 'value:banana with number:3 should return edqdqd' do

                    solution=tesing_value

                    expect(solution).to eq('edqdqd')
                end

                it "phrase:'we like butter!' value:5 should return:bj qnpj gzyyjw! " do
                    solution=testing_second_value

                    expect(solution).to eq('bj qnpj gzyyjw!')
                end
            end

            context 'cipher a big letter word and phrase' do

                subject(:t1){described_class.new('B',5)}

                subject(:t2){described_class.new('ooDJaDJa',7)}


                it 'Big letter test' do
                    solution=t1.cipher_the_word

                    expect(solution).to eq('G')
                end

                it 'Small letters combined with Big letters' do
                    solution=t2.cipher_the_word

                    expect(solution).to eq('vvKQhKQh')
                end

            end
        end

    end



end

