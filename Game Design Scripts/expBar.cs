using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class expBar : MonoBehaviour
{
    // public variables
    public Slider expSlider;

    // set the experience bar to reflect the experience points the player has
    public void SetExp(int exp)
    {
        expSlider.value = exp;
    }

    // set the maximum amount of experience points the player can get per level
    public void SetMaxExp(int exp)
    {
        expSlider.maxValue = exp;
    }
}
