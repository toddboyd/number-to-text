# NumberToText Class

NumberToText is an apex class that converts and integer into a text representation of that integer.
## Examples
|number|text|
|--|--|
|0|zero|
|1|one|
|-136|negative one hundred thirty-six|
|12489543|twelve million four hundred eighty-nine thousand five hundred forty-three|

## Methods

**convert(value)** 

#### Signature

`public String convert(Integer value)`

#### Usage
Converts any integer value to a lowercase text representation of that integer. Negative values are prepended with the word 'negative.' Values between 21-99 are hyphenated. E.g. twenty-one.
#### Example

    Integer value = 125;
    Integer negativeValue = -125;
    String result = NumberToText.convert(value);
    String negativeResult = NumberToText.convert(negativeValue);
    // result = 'one hundred twenty-five'
    // negativeResult = 'negative one hundred twenty-five'