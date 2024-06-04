import Random "mo:base/Random";
import Nat8 "mo:base/Nat8";

actor RandomNumberGenerator {
  func getRandomNumber(max : Nat8) : async Nat8 {
    var rand = Random.byteFrom(await Random.blob());
    while (rand > max) {
      rand := rand / max;
    };
    return rand;
  };

  public func guessNumber(guess : Nat8) : async Text {
    let rand = await getRandomNumber(10);

    if (Nat8.less(guess, rand)) {
      return "Too small. Number is close to " # Nat8.toText(Nat8.add(rand, 5));
    };

    if (Nat8.greater(guess, rand)) {
      return "Too big. Number is close to " # Nat8.toText(Nat8.add(rand, 5));
    };

    return "You got it. Number is " # Nat8.toText(rand);
  };
};
