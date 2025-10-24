/*Programa que cuenta la subcadenna de una cadena cuyos caracteres no se repiten, osea la cadena más larga con caracteres que no se repiten */
class Solution {
    public int lengthOfLongestSubstring(String s) {

        int acc = 0;
        int total = 0;
        char cha;
        char cha1;
        int i = 0;
         for (int j = 0; j < s.length(); j++) {
                cha = s.charAt(i);
                cha1 = s.charAt(j);

                if (cha1 == cha) {
                    if(total < acc){
                          total = acc;
                    }
                    acc = 0;
                    i = j;
                } else{
                    j  += 1;
                }

            
            }

        return total;
    };
}