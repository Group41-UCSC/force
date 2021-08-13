package com.project.royalscouts.utils;

import java.util.Arrays;

public class Helper {

  private Helper() {
  }

  public static boolean stringContainsItemFromList(String inputStr, String[] items) {
    return Arrays.stream(items).anyMatch(inputStr::contains);
  }
}
