import React, { Component} from 'react';
import Post from '../../Post/components/Post';
import PostEditor from '../../PostEditor/components/PostEditor';
import { ref, onValue, push} from 'firebase/database';

class ThreadDisplay extends Component {
  constructor(props) {
    super(props);
    //var hi = this.props.database.toString();
    //console.log(hi);
    this.databaseRef = ref(this.props.database);
    this.addPost = this.addPost.bind(this);
    this.updateLocalState = this.updateLocalState.bind(this);

    this.state = {
      posts: [],
    };
    }
  

  componentDidMount() {
    const { updateLocalState } = this;
    onValue(this.databaseRef, function (snapshot) {
      const response = snapshot.val();
      console.log("onValue: ");
      console.log(response);

      updateLocalState(response);
      
    });
    // get(this.databaseRef).then((snapshot) => {
    //   if (snapshot.exists()) {
    //     console.log("snapshot.val()");
    //     console.log(snapshot.val());
    //   } else {
    //     console.log("No data available");
    //   }
    // }).catch((error) => {
    //   console.error(error);
    // });
  }

  addPost(postBody) {
    const postToSave = { postBody };
    console.log(`add post postBody pass to Post ${JSON.stringify(postBody)} `);
    const newPostKey = push(this.databaseRef, postToSave).key;
    const addData = Object.values(postBody);
    console.log("push addData: " + addData);
    
    console.log("push newpostkey: " + newPostKey);
    const updates = {};
    updates[this.databaseRef = newPostKey] = postBody;
    console.log("addpost state: " + this.state.posts);
  }

  updateLocalState(response) {
    console.log("response: " + Object.values(response));
    //const postsState = this.state.posts;
    //const brokenDownPost = response.postBody.split(/[\r\n]/g);
    
    //console.log("brokenDownPost: " + brokenDownPost);
    //posts.push(brokenDownPost);
    //const postsData = response;
    
    //console.log("postsData: ");
    //console.log(postsData);
    const postData = Object.values(response);
    console.log("postData: " + postData);

    this.state.posts.push(postData);
    
    console.log("postsState end& state:");
    console.log(this.state.posts);
      
    this.setState({
      posts: postData,
    });
  }

  render() {
    return (
      <div>
        {
          /*this.state.posts.map((postBody, idx) => {
            return (
              <Post key={idx} postBody={postBody}/>
              
            )
          })*/

          this.state.posts.map((postBody, idx) => {
            console.log(`postBody pass to Post ${JSON.stringify(postBody)} `);
            return (
              <Post key={idx} postBody={postBody.postBody} />
            )
          })
        }
        <PostEditor addPost={this.addPost} />
      </div>
    );
  }
}

export default ThreadDisplay;