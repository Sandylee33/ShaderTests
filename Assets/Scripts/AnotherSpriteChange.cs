using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnotherSpriteChange : MonoBehaviour {

    public Sprite[] sprites;

    private SpriteRenderer sRenderer;
	// Use this for initialization
	void Start () {
        sRenderer = GetComponent<SpriteRenderer>();	
        StartCoroutine(SpriteChangeAuto());
	}
	
    IEnumerator SpriteChangeAuto()
    {
        while (true)
        {
            for (int i = 0;i < 2;i++)
            {
                sRenderer.sprite = sprites[i];
                yield return new WaitForSeconds(1.4f);
            }
            //yield return new WaitForSeconds(1f);
        }
    }
	
}
