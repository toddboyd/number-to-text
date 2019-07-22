@isTest
public class NumberToTextTest {
    private static Map<Integer,String> testData = new Map<Integer,String> {
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
        19 => 'nineteen',
        20 => 'twenty',
        21 => 'twenty-one',
        30 => 'thirty',
        40 => 'forty',
        50 => 'fifty',
        60 => 'sixty',
        70 => 'seventy',
        80 => 'eighty',
        90 => 'ninety',
        100 => 'one hundred',
        135 => 'one hundred thirty-five',
        1000 => 'one thousand',
        42559 => 'forty-two thousand five hundred fifty-nine',
        1000000 => 'one million',
        13765345 => 'thirteen million seven hundred sixty-five thousand three hundred forty-five',
        1000000000 => 'one billion',
        1999888000 => 'one billion nine hundred ninety-nine million eight hundred eighty-eight thousand',
        2147483647 => 'two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven',
        -2147483647 => 'negative two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven'
    };

    @IsTest
    static void numberToTextTest(){
        // Arrange
        Map<Integer,String> results = new Map<Integer,String>();

        // Act
        Test.startTest();
        for(Integer key : testData.keySet()) {
            String result = NumberToText.convert(key);
            results.put(key, result);
        }
        Test.stopTest();

        // Assert
        for(Integer key : testData.keySet()) {
            System.assertEquals(testData.get(key), results.get(key));
        }
    }
}