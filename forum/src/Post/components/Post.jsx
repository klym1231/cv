import React from 'react';

// const Post = (props) => (

//   <div className="panel panel-default post-body">
//     <div className="panel-body">
//       {
//         props.postBody.map((postPart, idx) => (
//           <div key={idx}>{postPart}</div>
//         ))
//       }
//     </div>
//   </div>


const Post = (props) => (
//   <div></div>
    <div className="panel panel-default post-body">
      <div className="panel-body">
        {
          props.postBody
          // props.state.posts.map((postBody, idx) => (
            
          //   <div key={idx}>{postBody}</div>
            
          // ))
        }
      </div>
    </div>
    
  );

export default Post;