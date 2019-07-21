public class NumberToText {
    static final Integer DIGITS_PER_SET = 3;
    static final String ZERO = 'zero';
    private static Map<Integer,String> tens = new Map<Integer,String> {
        20 => 'twenty',
        30 => 'thirty',
        40 => 'forty',
        50 => 'fifty',
        60 => 'sixty',
        70 => 'seventy',
        80 => 'eighty',
        90 => 'ninety'
    };
    private static Map<Integer,String> smallNumbers = new Map<Integer,String> {
        0 => 'zero',
        1 => 'one',
        2 => 'two',
        3 => 'three',
        4 => 'four',
        5 => 'five',
        6 => 'six',
        7 => 'seven',
        8 => 'eight',
        9 => 'nine',
        10 => 'ten',
        11 => 'eleven',
        12 => 'twelve',
        13 => 'thirteen',
        14 => 'fourteen',
        15 => 'fifteen',
        16 => 'sixteen',
        17 => 'seventeen',
        18 => 'eighteen',
        19 => 'nineteen'
    };
    private static Map<Integer,String> modifiers = new Map<Integer,String> {
        1 => 'thousand ',
        2 => 'million ',
        3 => 'billion '
    };    
    
    public static String convert(Integer value) {
        // zero is a special case
        if (value == 0)
            return ZERO;

        // text representation of the number to convert. e.g. 'one hundred'
        String numberText = '';

        // If value is negative prepend the text with 'negative'
        // and then process as a positive value
        if (value < 0) {
            numberText = 'negative ';
            value *= -1;
        }

        // string representation of the number to convert. e.g. '100'
        String numberString = String.valueOf(value);

        // split the number into sets (hundreds, thousands, millions, billions)
        // and convert each as a three digit number.
        while(numberString.length() > 0){
            // Figure out how many digits are in this set
			Integer digits = Math.mod(numberString.length(), DIGITS_PER_SET) == 0 ?
                			 DIGITS_PER_SET :
            				 Math.mod(numberString.length(), DIGITS_PER_SET);

            // Create a string to represent this set.
            String thisSet = numberString.substring(0, digits);

            // Convert the set into an integer and generate the text for this set.
            Integer valueToConvert = Integer.valueOf(thisSet);

            // Remove the first set from numberString now that it has been converted.
            numberString = numberString.substring(digits, numberString.length());

            if (valueToConvert > 0) {                
                String setText = generateText(valueToConvert);

                // Calculate the modifierIndex to determine what set this is
                // e.g. thousands, millions, billions.
                Integer modifierKey = numberString.length() / DIGITS_PER_SET;

                // Create the modifier string
                String modifier = modifierKey > 0 ? ' ' + modifiers.get(modifierKey) : '';

                // Build the text
                numberText += setText + modifier;
            }
        }    
        return numberText.trim();
    }

    private static String generateText(Integer value) {
        if (value < 100)
            return generateTextForTwoDigits(value);

        String numberText = '';

        // Calculate the number of hundreds
        Integer hundreds = value / 100;
        if (hundreds > 0)
            numberText = generateTextForTwoDigits(hundreds) + ' hundred';

        // Calculate the leftover value
        Integer leftOver = Math.mod(value, 100);
        if (leftOver > 0)
            numberText += ' ' + generateTextForTwoDigits(leftOver);
        return numberText;
    }

    private static String generateTextForTwoDigits(Integer value) {
        if (value < 20) {
        	return smallNumbers.get(value);
        }

        // Round the value down to the nearest 10 and get the text representation
        Integer tensKey = (value/10) * 10;
        String numberText = tens.get(tensKey);

        // Calculate the leftover value
        Integer leftOver = value - tensKey;

        if (leftOver > 0) {
            // Add a hypen for values between 21 - 99.
            // https://www.grammarly.com/blog/hyphen-in-compound-numbers/
            if (tensKey >= 20 && tensKey <= 90 && leftOver > 0) {
                numberText += '-';
            }
            numberText += generateTextForTwoDigits(leftOver);
        }
        return numberText;
    }
}