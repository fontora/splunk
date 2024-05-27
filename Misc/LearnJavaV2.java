package Misc;

import java.util.ArrayList;

public class LearnJavaV2 {
  public static void main(String[] args) {
    // Primitives
    int a = 5;
    char b = 'i';
    long c = 400;
    double d = 3.2;
  
    // Objects?
    String name = "Susan"; 
    
    // Output
    System.out.println(name.toUpperCase());
    System.out.println(name.toLowerCase());

    addExclaimationPoint("hot dogs");
    String foo = addExclaim("Floop");
    System.out.println(foo);

    Animal a1 = new Animal();
    String dog = a1.iAmDog();
    System.out.println(dog);

    ArrayList<Integer> al1 = new ArrayList<>();

    a1.doStuff();
   
  }

  public static void addExclaimationPoint(String s) {
    System.out.println(s + "!");
  }

  public static String addExclaim(String s) {
    return s + "!";
  }  

}
