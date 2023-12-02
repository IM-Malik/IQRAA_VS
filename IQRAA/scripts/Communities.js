var communityDataJson = document.getElementById('hdnCommunityData').value;
var communityData = JSON.parse(communityDataJson);

// Call the function with the data
loadCommunities(communityData);
function loadCommunities(communities) {
    console.log('Communities.js script loaded2');

    console.log(communities);

    var communityListDiv = document.getElementById('communityList');

    communityListDiv.innerHTML = '';

    communities.forEach(function (community) {
        var communityCard = createCommunityCard(community);
        communityListDiv.appendChild(communityCard);
    });
}

function createCommunityCard(community) {
    var cardDiv = document.createElement('div');
    cardDiv.className = 'communityCard';

    var titleElement = document.createElement('h2');
    titleElement.className = 'communityTitle';
    titleElement.textContent = community.Name;

    var baseElement = document.createElement('p');
    baseElement.className = 'communityBase';
    baseElement.textContent = 'Base: ' + (community.Base ? community.Base : 'Not specified');

    var membersElement = document.createElement('p');
    membersElement.className = 'communityMembers';
    membersElement.textContent = 'Members: ' + community.MemberCount;

    var ratingElement = document.createElement('div');
    ratingElement.className = 'communityRating';
    ratingElement.innerHTML = 'Rating: ' + generateStarRating(community.Rating);

    var joinButton = document.createElement('button');
    joinButton.className = 'joinButton';
    joinButton.textContent = 'Join';

    cardDiv.appendChild(titleElement);
    cardDiv.appendChild(baseElement);
    cardDiv.appendChild(membersElement);
    cardDiv.appendChild(ratingElement);
    cardDiv.appendChild(joinButton);

    return cardDiv;
}

function generateStarRating(rating) {
    if (rating === null || rating === undefined) {
        return 'Rating not available';
    }

    var roundedRating = Math.round(rating); // Round the rating to the nearest integer
    var starRating = '';

    for (var i = 1; i <= 5; i++) {
        var starClass = i <= roundedRating ? 'fa fa-star checked' : 'fa fa-star';
        if (starClass.endsWith('checked')) {
            starRating += '<span style="font-size: 20px; margin-right: 3px; color: orange;" class="' + starClass + '"></span>';
        } else {
            starRating += '<span style="font-size: 20px; margin-right: 3px; color: grey;" class="' + starClass + '"></span>';

        }

    }

    return starRating;
}

