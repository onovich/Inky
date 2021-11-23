using System.Collections;
using System.Collections.Generic;
using Ink.Runtime;
using UnityEngine;
using UnityEngine.UI;

public class InkTexting : MonoBehaviour
{
    public TextAsset inkJSON;
    public Story story;
    public Text textPrefab;
    public Button buttonPrefab;
    public Canvas canvas;

    private void Start()
    {
        story = new Story(inkJSON.text);
        //Debug.Log(story.Continue());
        //Debug.Log(story.ContinueMaximally());


        RefreshUI();
     
    }

    void RefreshUI()
    {
        EraseUI();

        Text storyText = Instantiate(textPrefab) as Text;

        string text = LoadStoryChunk();
        List<string> tags = story.currentTags;
        string name = story.currentFlowName;
        Debug.Log("name="+name);
        if (tags.Count > 0)
        {
            text = "<b>"+tags[0] + "</b> -" + text;
            Debug.Log("tag="+tags[0]);
        }
        else
        {
            Debug.Log("tag=0");
        }

        storyText.text = text;
        storyText.transform.SetParent(canvas.transform, false);

        foreach (Choice choice in story.currentChoices)
        {
            Button choiceButton = Instantiate(buttonPrefab) as Button;
            choiceButton.transform.SetParent(canvas.transform, false);

            Text choiceText = choiceButton.GetComponentInChildren<Text>();
            choiceText.text = choice.text;

            choiceButton.onClick.AddListener(delegate
            {
                ChooseStoryChoice(choice);

            });
        }
    }

    void EraseUI()
    {
        for(int i = 0; i < canvas.transform.childCount; i++)
        {
            Destroy(canvas.transform.GetChild(i).gameObject);
        }
    }

    void ChooseStoryChoice(Choice choice)
    {
        story.ChooseChoiceIndex(choice.index);
        RefreshUI();
    }

    string LoadStoryChunk()
    {
        string text = "";
        if (story.canContinue)
        {
            text = story.ContinueMaximally();

        }
        return text;
    }



}
